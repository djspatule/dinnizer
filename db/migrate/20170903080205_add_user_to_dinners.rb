class AddUserToDinners < ActiveRecord::Migration[5.1]
  def change
    add_reference :dinners, :user, foreign_key: true
  end
end
