class AddDayRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :pickup, :datetime
    add_column :requests, :dropoff, :datetime
    add_column :requests, :status, :integer
    add_column :requests, :verified, :boolean
    add_column :requests, :car_id, :integer
  end
end
