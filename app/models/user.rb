class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def self.create_with_omniauth(auth)
           create! do |user|
             user.provider = auth['provider']
             user.uid = auth['uid']
             if auth['info']
               user.name = auth['info']['name'] || ""
               user.email = auth['info']['email'] || ""
               user.password = SecureRandom.urlsafe_base64
             end
           end
         end
end
