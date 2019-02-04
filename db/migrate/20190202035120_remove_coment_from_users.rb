class RemoveComentFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :comment, :text
    remove_column :users, :avatar, :text
  end
end
