class ItmePhoto < ActiveRecord::Migration[5.2]
  def change
    drop_table :itme_photos
  end
end
