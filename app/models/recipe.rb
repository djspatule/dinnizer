class Recipe < ApplicationRecord
  has_attachment :recipe_photo
  has_many :dinner_recipes, dependent: :destroy
  has_many :dinners, through: :dinner_recipes
  belongs_to :user

end
