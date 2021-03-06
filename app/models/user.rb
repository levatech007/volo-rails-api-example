class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :calendars, dependent: :destroy
  has_many :images, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         #:confirmable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]

  include DeviseTokenAuth::Concerns::User
end
