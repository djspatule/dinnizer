class Recipe < ApplicationRecord
  has_attachment :recipe_photo
  validates :name, presence: true
  has_many :dinners
  belongs_to :user
end
