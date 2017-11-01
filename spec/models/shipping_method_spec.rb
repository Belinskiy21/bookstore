require 'rails_helper'

RSpec.describe ShippingMethod, type: :model do
  context 'associations' do
    it { should have_many :orders }
  end
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most 50 }
    it { should validate_presence_of :price }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to 0 }
    it { should validate_presence_of :min_days }
    it { should validate_numericality_of(:min_days).is_greater_than_or_equal_to 0 }
    it { should validate_presence_of :max_days }
    it { should validate_numericality_of(:max_days).is_greater_than_or_equal_to 3 }
  end
end
