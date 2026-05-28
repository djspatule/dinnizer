class AddUniqueIndexesToDinnerJoinTables < ActiveRecord::Migration[5.1]
  def change
    add_index :dinner_recipes, [:dinner_id, :recipe_id], unique: true
    add_index :dinner_guests, [:dinner_id, :guest_id], unique: true
  end
end
