require 'rails_helper'

RSpec.feature 'visiting Home page', type: :feature do
  before :each {visit root_path}
  after :each { Warden.test_reset! }
  describe 'header' do
    context 'guest user' do
      it { expect(page).to have_content I18n.t('title') }
      it { expect(page).to have_content I18n.t('home') }
      it { expect(page).to have_content I18n.t('shop') }
      it { expect(page).to have_content I18n.t('my_account') }
      it { expect(page).to have_content I18n.t('log_in') }
      it { expect(page).to have_content I18n.t('sign_up') }
      it { expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '0' }
    end

    context 'as signed_in user', skip: 'because confirmable' do
      before { sign_in_as_user }
      it { expect(page).to have_content I18n.t('log_out') }
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
  end

  describe "footer" do
    context 'guest user'do
    it { expect(page).to have_content I18n.t('title') }
    it { expect(page).to have_content I18n.t('home') }
    it { expect(page).to have_content 'support@bookstore.com' }
    it { expect(page).to have_content '(555)-555-5555' }

    end

    context 'as signed_in user', skip: 'because confirmable' do
      before { sign_in_as_user }
      it { expect(page).to have_content I18n.t('settings') }
      it { expect(page).to have_content I18n.t('my_account') }
      it { expect(page).to have_content I18n.t('orders') }
    end
  end
end
