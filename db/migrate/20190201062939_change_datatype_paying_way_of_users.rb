class ChangeDatatypePayingWayOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :paying_way, :integer, null: false, limit: 1, default: 0
  end
end
