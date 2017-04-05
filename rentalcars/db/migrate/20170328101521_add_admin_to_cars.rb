class AddAdminToCars < ActiveRecord::Migration[5.0]
  def change
     add_column :cars, :admin, :boolean, default: false
  end
end
