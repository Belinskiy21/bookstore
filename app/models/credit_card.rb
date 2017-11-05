class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :number , :name, :mm_yy, :cvv, presence: true
  validates_length_of :cvv, in: 3..4
  validates :cvv, numericality: { only_integer: true }
  validates_format_of :mm_yy, with: %r{\A(0[1-9]|10|11|12)\/\d\d\z}, message: I18n.t('mm_yy')
  validates_format_of :number, with: %r{\A\d{16}\z}, message: I18n.t('cart_number_valid')
  validates_format_of :name, with: %r{\A[a-zA-Z\s]{0,49}\z}, message: I18n.t('cart_name')


end
