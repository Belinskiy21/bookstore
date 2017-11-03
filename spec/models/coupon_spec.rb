require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it { should belong_to :order }
  it { should validate_presence_of :code }
  it { should validate_presence_of :discount }
  it { should validate_numericality_of(:discount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to 1 }
end
