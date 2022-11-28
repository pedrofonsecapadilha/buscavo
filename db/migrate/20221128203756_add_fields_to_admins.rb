class AddFieldsToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :phone_number, :string
    add_column :admins, :credit_card_name, :string
    add_column :admins, :credit_card_number, :string
    add_column :admins, :credit_card_date, :string
    add_column :admins, :credit_card_security, :string
    add_column :admins, :user_first_name, :string
    add_column :admins, :user_last_name, :string
    add_column :admins, :user_phone_number, :string
  end
end
