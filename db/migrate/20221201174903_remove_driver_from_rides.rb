class RemoveDriverFromRides < ActiveRecord::Migration[7.0]
  def change
    remove_column :rides, :driver_id, :foreign_key
  end
end
