class DinnerRecipe < ApplicationRecord
  belongs_to :dinner
  belongs_to :recipe

  validates :recipe_id, uniqueness: { scope: :dinner_id }
end
