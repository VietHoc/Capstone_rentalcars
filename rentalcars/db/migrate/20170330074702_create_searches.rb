class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :isCar
      t.string :brand
      t.string :model
      t.integer :price
      t.integer :seat
      t.string :about
      t.datetime :pickup
      t.datetime :dropoff
      t.timestamps
    end
  end
end
