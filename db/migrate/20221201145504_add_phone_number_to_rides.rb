class AddPhoneNumberToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :user_phone_number, :string
  end
end
