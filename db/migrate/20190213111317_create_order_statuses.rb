class CreateOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :order_statuses do |t|
      t.references :purchaser, foreign_key: { to_table: :users }
      t.references :seller, foreign_key: { to_table: :users }
      t.integer :status, null: false
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
