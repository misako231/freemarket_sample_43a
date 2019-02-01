class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.text       :comment, null: false
      t.integer    :category_id, null: false
      t.integer    :brand_id, null: false
      t.boolean    :shipping_fee, null: false
      t.integer    :prefecture, null: false
      t.integer    :days_to_ship, null: false
      t.integer    :price, null: false
      t.integer    :condition, null: false
      t.integer    :user_id, null: false
      t.boolean    :closed ,null: false, default: false
      t.timestamps
    end
  end
end
