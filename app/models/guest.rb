class Guest < ApplicationRecord
  has_attachment :guest_photo
  validates :last_name, presence: true
  has_many :dinners
end
