class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.text       :comment, null: false
      t.integer    :category_id, null: false, foreign_key: true
      t.integer    :brand_id, null: true, foreign_key: true
      t.boolean    :shipping_fee, null: false
      t.integer    :prefecture_id, null: false
      t.integer    :days_to_ship, null: false
      t.integer    :price, null: false
      t.integer    :condition, null: false
      t.references    :user, null: false, foreign_key: true
      t.boolean    :closed ,null: false, default: false
      t.integer    :transportiotation_method, null: false
      t.timestamps
    end

    add_index :items, :name
  end
end
