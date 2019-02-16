class AddOrderStatusIdToPointRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :point_records, :order_status, foreign_key: true
  end
end
