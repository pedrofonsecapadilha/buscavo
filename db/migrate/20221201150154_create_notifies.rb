class CreateNotifies < ActiveRecord::Migration[7.0]
  def change
    create_table :notifies do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
