class AddComentToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :comment, :text, null: true
    add_column :profiles, :avatar, :text, null: true
  end
end
