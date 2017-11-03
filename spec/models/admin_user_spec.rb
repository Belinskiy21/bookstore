require 'cancan/matchers'

RSpec.describe AdminUser, :admin_user do
  describe "abilities" do
    subject(:ability) { Ability.new(admin_user) }
    let(:admin_user) { FactoryGirl.create(:admin_user) }

    it { is_expected.to be_able_to(:read, Address.new) }
    it { is_expected.to be_able_to(:read, Coupon.new) }
    it { is_expected.to be_able_to(:read, CreditCard.new) }
    it { is_expected.to be_able_to(:read, ShippingMethod.new) }
    it { is_expected.to be_able_to(:read, OrderItem.new) }
    it { is_expected.to be_able_to(:manage, Author.new) }
    it { is_expected.to be_able_to(:manage, Book.new) }
    it { is_expected.to be_able_to(:manage, Category.new) }
    it { is_expected.to be_able_to(:manage, AdminUser.new) }
    it { is_expected.to be_able_to(:manage, OrderItem.new) }
    it { is_expected.to be_able_to(:update, Review.new) }
    it { is_expected.to be_able_to(:destroy, Review.new) }
    it { is_expected.to be_able_to(:update, Order.new) }
  end
end
