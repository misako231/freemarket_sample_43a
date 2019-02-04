class ChangeDatatypeCategoryOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :category_id , :integer, default: 1
    change_column :items, :brand_id, :integer, default: 1
  end
end
