class Dinner < ApplicationRecord
  belongs_to :user
  has_many :dinner_recipes, dependent: :destroy
  accepts_nested_attributes_for :dinner_recipes, allow_destroy: true#, reject_if: :recipe_clones
  has_many :recipes, through: :dinner_recipes
  has_many :dinner_guests, dependent: :destroy
  accepts_nested_attributes_for :dinner_guests, allow_destroy: true
  has_many :guests, through: :dinner_guests
end
