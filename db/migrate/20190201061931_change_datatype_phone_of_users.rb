class ChangeDatatypePhoneOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :integer, null: false, limit: 5
  end
end
