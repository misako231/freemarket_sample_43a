class RemovePayingWayFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :paying_way, :integer
  end
end
