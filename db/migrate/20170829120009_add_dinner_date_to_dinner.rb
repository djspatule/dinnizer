class AddDinnerDateToDinner < ActiveRecord::Migration[5.1]
  def change
    add_column :dinners, :dinner_date, :date
  end
end
