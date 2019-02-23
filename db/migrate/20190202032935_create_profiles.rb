class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table    :profiles do |t|
      t.integer     :phone,        null: false, limit: 5
      t.integer     :postal_code,  null: false
      t.integer     :prefecture_id,   null: false
      t.string      :city,         null: false
      t.string      :block,        null: false
      t.string      :building,     null: true
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
