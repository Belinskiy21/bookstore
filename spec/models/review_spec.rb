require 'rails_helper'

RSpec.describe Review, type: :model do
  context "associations" do
    it { should belong_to :user }
    it { should belong_to :book }
  end
  context 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :book_id }
    it { should validate_presence_of :content }
    it { should validate_presence_of :rate }
    it { should validate_numericality_of(:rate).is_greater_than_or_equal_to(1)
    .is_less_than_or_equal_to 5 }
    it { should allow_value('Hello world!').for :content }
    it { should_not allow_value('H@llo #orld!').for :content }
  end
  context 'public methods' do
    it { should respond_to :approve! }
    it { should respond_to :reject! }
  end
end
