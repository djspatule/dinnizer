class CreateDinnerGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :dinner_guests do |t|
      t.references :dinner, foreign_key: true
      t.references :guest, foreign_key: true

      t.timestamps
    end
  end
end
