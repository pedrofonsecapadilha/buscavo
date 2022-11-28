class AddFieldsToDrivers < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :first_name, :string
    add_column :drivers, :last_name, :string
    add_column :drivers, :phone_number, :string
    add_column :drivers, :wallet, :decimal
  end
end
