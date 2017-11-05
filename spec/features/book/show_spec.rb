require 'rails_helper'

RSpec.feature 'Visiting Book page', type: :feature do
  before :each do
    @book = FactoryGirl.create(:book_with_review)

  end

  describe 'body' do
    before { visit book_path(@book) }
    subject { page.find('body') }
    it { expect(subject).to have_content I18n.t ('button.back_to_results') }
    it { expect(subject).to have_content 'Year of publication' }
    it { expect(subject).to have_content I18n.t ('dimension') }
    it { expect(subject).to have_content @book.title }
    it { expect(subject).to have_content @book.materials }
    it { expect(subject).to have_content @book.year_of_publication }
  end

  describe 'Add to Cart' do
   let(:shop_icon) { page.find('a.hidden-xs>span.shop-icon') }
   let(:plus) { find(:xpath, ".//a[child::i[contains(@class,\"fa-plus\")]]") }
   let(:minus) { find(:xpath, ".//a[child::i[contains(@class,\"fa-minus\")]]") }
   before { visit book_path(@book) }

   it 'has no items in cart' do
     expect(shop_icon).to have_content ''
   end

   context 'amount of books' do
     it 'increase quantity', js: true do
       plus.trigger('click')
       expect(page.find('#order_item_quantity').value).to eq '1'
     end

     it 'can`t be less then 1', js: true do
       minus.trigger('click')
       expect(page.find('#order_item_quantity').value).to eq '1'
     end
   end

   it 'add four items into cart', js: true do
     fill_in 'order_item[quantity]', with: '4'
     click_on I18n.t('button.add_to_cart')
     expect(shop_icon).to have_content '4'
   end

   it 'add one item into cart', js: true do
     click_on I18n.t('button.add_to_cart')
     expect(shop_icon).to have_content '1'
   end
 end

 describe 'Review' do
   let(:post_review_form) { page.find('#post_review') }
   before do
     sign_in_as_user
     visit book_path(@book)
   end

   it 'here is form for review' do
     expect(page).to have_content I18n.t('write')
     expect(page).to have_css('#post_review')
   end

   it 'user can rate book' do
     expect(page).to have_content 'Rate'
   end

   it 'user can post review' do
     fill_in 'review[content]', with: 'It was the best book in my life'
     click_on I18n.t('button.post')
     expect(page).to have_content I18n.t('thanks_message')
   end

   it 'do not save unpermited review' do
     fill_in 'review[content]', with: '!@#$#%^$^%&^**&((/'
     click_on I18n.t('button.post')
     expect(page).to have_content I18n.t('smth_went_wrong')
   end

   context 'if User Log Out' do
     before { all(:link, I18n.t('log_out'))[1].click }

     it 'he can not write a review' do
       expect(page).not_to have_content I18n.t('write')
     end

     it 'user can`t see form' do
       expect(page).not_to have_css('#post_review')
     end
   end
 end
end
