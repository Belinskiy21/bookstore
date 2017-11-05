class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders, dependent: :destroy
  has_many :reviews
  has_many :addresses
  has_many :credit_cards
  has_one :billing
  has_one :shipping

  validates_uniqueness_of :uid, unless: Proc.new { provider.nil? }, scope: :provider
  validates_format_of :email,:with => Devise::email_regexp
  validates :password, format: {
    with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{8,}\z/
    }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
