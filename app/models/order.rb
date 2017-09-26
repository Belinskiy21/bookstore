class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  belongs_to :user, optional: true
  include AASM

  aasm :column => 'order_state',whiny_transitions: false do
   state :in_progress, initial: true
   state :processing
   state :in_delivery
   state :delivered
   state :canceled

   event :completed do
     transitions from: :in_progress, to: :processing
   end

   event :sent_to_client do
     transitions from: :processing, to: :in_delivery
   end

   event :delivered do
     transitions from: :in_delivery, to: :delivered
   end

   event :canceled do
     transitions from: [:processing, :in_delivery], to: :canceled
   end
  end

  def subtotal
    order_items.collect { |item| item.valid? ? (item.quantity * item.unit_price) : 0}.sum
  end

  def empty?
    order_items.empty?
  end
end
