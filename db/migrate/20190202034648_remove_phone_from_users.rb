class RemovePhoneFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :phone, :integer
    remove_column :users, :prefecture, :integer
    remove_column :users, :postal_code, :integer
    remove_column :users, :city, :string
    remove_column :users, :block, :string
    remove_column :users, :building, :string
  end
end
