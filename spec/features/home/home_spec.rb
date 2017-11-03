require 'rails_helper'

RSpec.feature 'visiting Home page', type: :feature do
  before :each {visit root_path}
  describe 'header' do
    context 'as guest user' do
      it { expect(page).to have_content I18n.t('title') }
      it { expect(page).to have_link I18n.t('home', root_path) }
      it { expect(page).to have_content I18n.t('shop') }
      it { expect(page).to have_content I18n.t('my_account') }
      it { expect(page).to have_link I18n.t('log_in', new_user_session_path) }
      it { expect(page).to have_link I18n.t('sign_up', new_user_registration_path) }
      it { expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '0' }
    end

    context 'user click link' do
      it 'shoping cart icon' do
        page.find('a.hidden-xs').click
        expect(page).to have_http_status(:success)
        expect(page).to have_content I18n.t('cart')
      end

      it 'Log in' do
        all(:link, I18n.t('log_in'))[1].click
        expect(page).to have_http_status(:success)
        expect(page).to have_content I18n.t('button.forgot_password')
        expect(page).to have_content 'Dont have account?'
        expect(page).to have_content I18n.t('remember_me')

      end

      it 'sign up' do
        all(:link, I18n.t('sign_up'))[1].click
        expect(page).to have_content I18n.t('confirm_password')
        expect(page).to have_selector :link_or_button, I18n.t('sign_up')
      end
    end

    context 'as signed_in user' do
      before { sign_in_as_user }
      it { expect(page).to have_link I18n.t('log_out', destroy_user_session_path) }
      it { expect(page).to have_link I18n.t('settings', edit_user_registration_path) }
      it { expect(page).to have_link I18n.t('orders', orders_path) }
      it { expect(page).not_to have_content I18n.t('log_in') }
      it { expect(page).not_to have_content I18n.t('sign_up') }
      it 'click link Log out' do
        all(:link, I18n.t('log_out'))[1].click
        expect(page).to have_content 'Signed out successfully.'
      end
      it 'click link Orders' do
        first(:link, I18n.t('orders')).click
        expect(page).to have_http_status(:success)
        expect(page).to have_content I18n.t('my_orders')
      end
      it 'click link Settings' do
        all(:link, I18n.t('settings'))[0].click
        expect(page).to have_selector :link_or_button, I18n.t('address')
        expect(page).to have_selector :link_or_button, I18n.t('privacy')
      end
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
        page.first(:button, I18n.t('button.buy_now')).click
        expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '1'
        expect(page).to have_content 'Book was added to you order!'
      end
    end

    context 'Best Sellers books' do
      before do
        @order_item = FactoryGirl.create(:order_item_best_sellers)
        visit root_path
      end
      it 'user click on eye icon ' do
        page.find(:linkhref, book_path(@order_item.book)).click
        expect(page).to have_http_status(:success)
        expect(page).to have_selector :link_or_button, I18n.t('button.back_to_results')
      end

      it 'user click on shopping cart icon' do
        page.find(:shopping_cart_icon, @order_item.book.id).click
        expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '1'
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
