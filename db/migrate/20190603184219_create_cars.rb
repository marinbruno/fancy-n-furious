class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :year
      t.text :car_description
      t.string :car_location
      t.string :category
      t.float :daily_amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
