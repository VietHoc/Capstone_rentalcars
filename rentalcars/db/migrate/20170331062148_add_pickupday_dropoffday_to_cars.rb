class AddPickupdayDropoffdayToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :pickup, :datetime
    add_column :cars, :dropoff, :datetime
  end
end
