class CreateFavoriteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
    add_index :favorite_items, [:user_id, :item_id], unique: true
  end
end
