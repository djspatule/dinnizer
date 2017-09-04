class Guest < ApplicationRecord
  has_attachment :guest_photo
  has_many :dinner_guests, dependent: :destroy
  has_many :dinners, through: :dinner_guests
  belongs_to :user
end
