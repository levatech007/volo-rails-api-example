class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  has_many :calendars, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
