class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :book, presence: true
  validates :order, presence: true

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end

  def subtotal
    unit_price * quantity
  end

  private

  def finalize
    self[:unit_price] = unit_price
    self[:subtotal] = subtotal
  end
end
