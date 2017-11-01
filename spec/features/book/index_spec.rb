require 'rails_helper'

RSpec.feature 'visiting Catalog', type: :feature do
  before :each { visit books_path }

  describe 'body page content' do
    context 'user can see' do
      it { expect(page).to have_selector :link_or_button, I18n.t('all') }
      it { expect(page).to have_selector :link_or_button, I18n.t('newest_first') }
      it { expect(page).to have_selector :link_or_button, I18n.t('popular_first') }
      it { expect(page).to have_selector :link_or_button, I18n.t('price_descending') }
      it { expect(page).to have_selector :link_or_button, I18n.t('price_ascending') }
      it { expect(page).to have_selector :link_or_button, I18n.t('title_ascending') }
      it { expect(page).to have_selector :link_or_button, I18n.t('title_descending') }
    end

    context ' #view more button' do
      before do
        FactoryGirl.create(:book)
        visit books_path
      end
      it 'hiden from user' do
        expect(page).not_to have_selector :link_or_button, I18n.t('button.view_more')
      end
    end
    context '#view more button not' do
      before do
        FactoryGirl.create_list(:book, 10)
        visit books_path
      end
      it 'hiden from user' do
        expect(page).to have_selector :link_or_button, I18n.t('button.view_more')
      end
    end
  end

  describe "filters" do
    let(:mobile_development) { Category.find_by_name('Mobile development') }
    let(:photo) { Category.find_by_name('Photo') }
    let(:web_design) { Category.find_by_name('Web design') }
    let(:filer_menu) { page.find('ul.list-inline.pt-10.mb-25.mr-240') }

    before(:all) do
      FactoryGirl.create_list(:book, 4, category_name: 'Mobile development')
      FactoryGirl.create_list(:book, 4, category_name: 'Photo')
      FactoryGirl.create_list(:book, 2, category_name: 'Web design')
    end

    before { visit books_path }

    context 'All (by default)' do
      it 'show all books' do
        expect(page).to have_selector('div.col-xs-6.col-sm-3', count: 8)
      end
    end

    context 'Mobile development' do
      before { filer_menu.find(:link, 'Mobile development').click }
      it 'user can see only category Mobile development books' do
        expect(page).to have_selector('div.col-xs-6.col-sm-3', count: 4)
      end
    end

    context 'Photo' do
      before { filer_menu.find(:link, 'Photo').click }
      it 'user can see only category Photo books' do
        expect(page).to have_selector('div.col-xs-6.col-sm-3', count: 4)
      end
    end

    context 'Web design' do
      before { filer_menu.find(:link, 'Web design').click }
      it 'user can see only category Web design books' do
        expect(page).to have_selector('div.col-xs-6.col-sm-3', count: 2)
      end
    end
  end
end
