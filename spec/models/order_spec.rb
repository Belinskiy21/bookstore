require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'association' do
    it { should have_many(:order_items).dependent :destroy }
    it { should have_many(:books).through :order_items}
    it { should have_one(:coupon).dependent :destroy }
    it { should have_many(:addresses).dependent :destroy }
    it { should have_one(:billing) }
    it { should have_one(:shipping) }
    it { should belong_to(:user) }
    it { should belong_to(:credit_card) }
    it { should belong_to(:shipping_method) }
  end
  context 'public methods' do
    it { should respond_to(:subtotal) }
    it { should respond_to(:empty?) }
    it { should respond_to(:total) }
    it { should respond_to(:discount_sum) }
    it { should respond_to(:shipping_price) }
    it { should respond_to(:finalize) }
  end
end
