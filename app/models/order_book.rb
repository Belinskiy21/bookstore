class OrderBook < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :book_present
  validate :order_present
end
