require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :description }
    it { should validate_presence_of :year_of_publication }
    it { should validate_presence_of :dimensions }
    it { should validate_presence_of :materials }
    it {
      should validate_numericality_of(:price)
        .is_greater_than_or_equal_to 0.01
    }
    it {
      should validate_numericality_of(:year_of_publication)
        .is_greater_than_or_equal_to(1900)
        .is_less_than_or_equal_to Time.now.year
    }

    it { should validate_length_of(:title).is_at_most 120 }
    it { should validate_length_of(:materials).is_at_most 80 }
    it { should validate_length_of(:description).is_at_least(5).is_at_most(2000) }
    it { should validate_presence_of :category_id }
  end
  context 'associations'
  it { should have_many :author_books }
  it { should have_many :authors }
  it { should belong_to(:category) }
  it { should have_many :order_items }
  it { should have_many(:orders).through :order_items }
  it { should have_many(:reviews).dependent :destroy }
  it { should have_many(:images).dependent :destroy }


end
