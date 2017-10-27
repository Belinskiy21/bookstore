require 'rails_helper'

RSpec.feature 'visiting Home page', type: :feature do
  before :each {visit root_path}
  after :each { Warden.test_reset! }
  describe 'header' do
    context 'guest user' do
      it { expect(page).to have_content I18n.t('title') }
      it { expect(page).to have_link I18n.t('home', root_path) }
      it { expect(page).to have_content I18n.t('shop') }
      it { expect(page).to have_content I18n.t('my_account') }
      it { expect(page).to have_link I18n.t('log_in', new_user_session_path) }
      it { expect(page).to have_link I18n.t('sign_up', new_user_registration_path) }
      it { expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '0' }
    end

    context 'as signed_in user' do
      before { sign_in_as_user }
      it { expect(page).to have_link I18n.t('log_out', destroy_user_session_path) }
      it { expect(page).to have_link I18n.t('settings', edit_user_registration_path) }
      it { expect(page).to have_link I18n.t('orders', orders_path) }
      it { expect(page).not_to have_content I18n.t('log_in') }
      it { expect(page).not_to have_content I18n.t('sign_up') }
    end
  end

  describe "body" do
    subject { page.find('div.carousel-inner') }
    before do
      FactoryGirl.create(:book, title: 'Ruby on Rails best practice')
      visit root_path
    end
    context 'all users can see' do
      it { expect(subject).to have_content 'Ruby on Rails best practice' }
      it { expect(page).to have_content I18n.t('greeting') }
      it { expect(page).to have_content I18n.t('text') }
      it { expect(page).to have_selector :link_or_button , I18n.t('button.get_started') }
      it { expect(page).to have_content I18n.t('best_sellers') }
    end

    context 'user click on Get Started' do
      before { click_link I18n.t('button.get_started') }
      it { expect(page).to have_http_status(:success) }
      it { expect(page).to have_content I18n.t('catalog') }
      it { expect(page).to have_content I18n.t('newest_first') }
    end
    context 'user click link' do
      it 'Buy Now and add book to card' do
        find_button("Buy Now").click
        expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '1'
        expect(page).to have_content 'Book was added to you order!'
      end
    end

  end

  describe "footer" do
    context 'guest user'do
    it { expect(page).to have_content I18n.t('title') }
    it { expect(page).to have_link I18n.t('home', root_path) }
    it { expect(page).to have_content 'support@bookstore.com' }
    it { expect(page).to have_content '(555)-555-5555' }

    end

    context 'as signed_in user' do
      before { sign_in_as_user }
      it { expect(page).to have_link I18n.t('settings',  edit_user_registration_path) }
      it { expect(page).to have_link I18n.t('orders', orders_path) }
      it { expect(page).to have_link I18n.t('shop', books_path) }
    end
  end
end
