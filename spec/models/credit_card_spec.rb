require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context 'associations' do
    it { should belong_to :user }
    it { should have_many :orders }
  end
  context 'validations' do
    it { should validate_presence_of :number }
    it { should validate_presence_of :name }
    it { should validate_presence_of :mm_yy }
    it { should validate_presence_of :cvv }
    it { should validate_length_of(:cvv).is_at_least(3).is_at_most 4 }
    it { should allow_value('12/21').for :mm_yy }
    it { should_not allow_value('22/21').for :mm_yy }
    it { should allow_value('1111111111111111').for :number }
    it { should_not allow_value('1111').for :number }
    it { should allow_value('Bat Man').for :name }
    it { should_not allow_value('@#1W').for :name }
  end
end
