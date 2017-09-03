class CreateDinners < ActiveRecord::Migration[5.1]
  def change
    create_table :dinners do |t|
      t.date :dinner_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
