require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'associations' do
    it { should belong_to :order }
    it { should belong_to :book }
  end
  context 'validation' do
    it {should validate_presence_of(:quantity) }
    it {should validate_numericality_of(:quantity).is_greater_than 0 }
    it {should validate_presence_of(:order) }
    it {should validate_presence_of(:book) }
  end
  context 'public metods' do
    it { should respond_to :unit_price }
    it { should respond_to :total_price }
  end
end
