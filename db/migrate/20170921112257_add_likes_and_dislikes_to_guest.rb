class AddLikesAndDislikesToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :likes_and_dislikes, :text
  end
end
