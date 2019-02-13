class CreatePointRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :point_records do |t|
      t.integer :point, null: false
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
