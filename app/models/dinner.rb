class Dinner < ApplicationRecord
  belongs_to :user
  has_many :dinner_guests, dependant: :destroy
  has_many :guests, through: :dinner_guests
  has_many :dinner_recipes, dependant: :destroy
  has_many :recipes, through: :dinner_recipes
end
