require 'rails_helper'

RSpec.feature 'All steps in checkout process', type: :feature do
  let(:user) { FactoryGirl.create(:user) }


  before do
    FactoryGirl.create(:book)
    FactoryGirl.create_list(:shipping_method, 2)
    @order = FactoryGirl.create(:order)
  end

  it 'should pass', js: true do
    sign_in(user)
    visit root_path
    page.first(:button, I18n.t('button.buy_now')).click
    expect(page.find('a.hidden-xs>span.shop-icon')).to have_content '1'
    wait_for_ajax
    visit root_path
    page.find('a.hidden-xs').click
    expect(page).to have_content I18n.t('cart')
    expect(page.current_path).to eq  cart_path(:order_id)
    page.find(:link_or_button, I18n.t('checkout')).click
    sleep 2
    expect(page.current_path).to eq checkout_path(:addresses)

    within('form#new_addresses_form') do
      fill_in 'addresses_form[billing][first_name]', with: 'Monica'
      fill_in 'addresses_form[billing][last_name]', with: 'Bellucci'
      fill_in 'addresses_form[billing][address]', with: 'West 999'
      fill_in 'addresses_form[billing][city]', with: 'NY'
      fill_in 'addresses_form[billing][zip]', with: '32158'
      select('Spain', from: 'addresses_form[billing][country]')
      fill_in 'addresses_form[billing][phone]', with: '+112 34 567 8998'

      fill_in 'addresses_form[shipping][first_name]', with: 'Monica'
      fill_in 'addresses_form[shipping][last_name]', with: 'Bellucci'
      fill_in 'addresses_form[shipping][address]', with: 'West 999'
      fill_in 'addresses_form[shipping][city]', with: 'NY'
      fill_in 'addresses_form[shipping][zip]', with: '32158'
      select('Spain', from: 'addresses_form[billing][country]')
      fill_in 'addresses_form[shipping][phone]', with: '+112 34 567 8998'

      page.find(:link_or_button, I18n.t('save_and_continue')).click
    end

    expect(page.current_path).to eq checkout_path(:delivery)
    all('.radio-label').first.click
    page.find(:link_or_button, I18n.t('save_and_continue')).click
    expect(page.current_path).to eq checkout_path(:payment)

    within('form#new_credit_card') do
      fill_in 'credit_card[number]', with: '1234123412341234'
      fill_in 'credit_card[name]', with: 'Monica'
      fill_in 'credit_card[mm_yy]', with: '03/19'
      fill_in 'credit_card[cvv]', with: '123'

      page.find(:link_or_button, I18n.t('save_and_continue')).click
    end

    expect(page.current_path).to eq checkout_path(:confirm)

    find('input[type="submit"]').click
    expect(page.current_path).to eq checkout_path(:complete)
    expect(page).to have_content  I18n.t('has_been_sent_to') + user.email
  end
end
