class Order < ApplicationRecord
  has_many :order_books, dependent: :destroy
  has_many :books, through: :order_books
  belongs_to :user, optional: true
  belongs_to :order_status

end
