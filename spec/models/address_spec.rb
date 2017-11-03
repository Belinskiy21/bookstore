require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'associations' do
    it { should belong_to :user }
    it { should belong_to :order }
  end
  context 'validates' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :country }
    it { should validate_presence_of :phone }
    it { should validate_length_of(:first_name).is_at_most 49 }
    it { should validate_length_of(:last_name).is_at_most 49 }
    it { should validate_length_of(:address).is_at_most 49 }
    it { should validate_length_of(:city).is_at_most 49 }
    it { should validate_length_of(:country).is_at_most 49 }
    it { should validate_length_of(:phone).is_at_most 15 }
    it { should validate_length_of(:zip).is_at_most 10 }
  end
  context 'public method' do
    it { should respond_to :clear_mask }
  end
end
