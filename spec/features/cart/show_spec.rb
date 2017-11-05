require 'rails_helper'

RSpec.feature 'Visiting Cart', type: :feature do
  before do
    @order = FactoryGirl.create(:order)
    visit cart_path(@order)
  end

  describe 'body' do
    subject { page.find('body') }
    it { expect(subject).to have_content I18n.t('cart') }
    it { expect(subject).to have_selector :link_or_button, I18n.t('checkout') }
    it { expect(subject).to have_selector :link_or_button, I18n.t('update_cart') }
    it { expect(subject).to have_content I18n.t('order_summary') }
    it { expect(subject).to have_content I18n.t('subtotal') }
    it { expect(subject).to have_content I18n.t('coupon') }
    it { expect(subject).to have_content I18n.t('total') }
    it { expect(subject).to have_content I18n.t('quantity') }
  end
end
