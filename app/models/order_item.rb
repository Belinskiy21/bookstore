class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :book, presence: true
  validates :order, presence: true

  before_save :finalize

  def unit_price
    book.price
  end

  def total_price
    unit_price * quantity
  end

  private

 def finalize
   self[:unit_price] = unit_price
   self[:total_price] = quantity * self[:unit_price]
 end

end
