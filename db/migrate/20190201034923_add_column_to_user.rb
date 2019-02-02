class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users,  :postal_code, :integer, null: false
    add_column :users,  :prefecture,  :integer, null: false
    add_column :users,  :city,        :string,  null: false
    add_column :users,  :block,       :string,  null: false
    add_column :users,  :building,    :string,  null: true
  end
end
