class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  belongs_to :user, optional: true
  belongs_to :order_status

end
