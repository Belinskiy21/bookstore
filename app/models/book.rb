class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :order_books
  has_many :orders, through: :order_books
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy


  validates :title, :price, :description,
            :published_at, :dimensions,
            :materials, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :published_at, numericality: {
                             greater_than_or_equal_to: 1900,
                             less_than_or_equal_to: Time.now.year
                           }
  validates :title, uniqueness: true
  validates_length_of :title, maximum: 120
  validates_length_of :materials, maximum: 80
  validates_length_of :description, in: 5..2000
end
