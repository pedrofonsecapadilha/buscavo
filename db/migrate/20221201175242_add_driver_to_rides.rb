class AddDriverToRides < ActiveRecord::Migration[7.0]
  def change
    add_reference :rides, :driver, foreign_key: { to_table: :drivers }, null: true
  end
end
