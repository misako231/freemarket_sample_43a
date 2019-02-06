class RemoveAncestryDepthFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :ancestry_depth, :integer
  end
end
