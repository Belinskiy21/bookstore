class Coupon < ApplicationRecord
  belongs_to :order, optional: true

  validates :code, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
