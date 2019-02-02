class ChangeDatatypeNameOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :name, :string, null: false
  end
end
