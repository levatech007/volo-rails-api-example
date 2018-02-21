class Location < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
