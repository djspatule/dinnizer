class Guest < ApplicationRecord
  has_many :dinner_guests, dependant: :destroy
  has_many :dinners, through: :dinner_guests
  belongs_to :user
end
