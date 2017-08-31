class Order < ApplicationRecord
  has_many :books, throgh: :order_books
  belongs_to :user, optional: true
  has_many :order_books, dependent: :destroy
  belongs_to :order_status
  
end
