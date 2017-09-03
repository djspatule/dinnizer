class Recipe < ApplicationRecord
  has_many :dinner_recipes, dependant: :destroy
  has_many :dinners, through: :dinner_recipes
  belongs_to :user

end
