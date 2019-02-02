class ChangeDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :brand_id, :integer, null: true
  end
end
