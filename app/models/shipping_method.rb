class ShippingMethod < ApplicationRecord
  has_many :orders

  validates :name, length: { maximum: 50 }, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
            presence: true
  validates :min_days, numericality: { greater_than_or_equal_to: 0, only_integer: true },
            presence: true
  validates :max_days, numericality: { greater_than_or_equal_to: :min_days, only_integer: true },
            presence: true
end
