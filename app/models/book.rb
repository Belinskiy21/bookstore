class Book < ApplicationRecord
  belongs_to :category
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :order_books
  has_many :orders, through: :order_books
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
end
