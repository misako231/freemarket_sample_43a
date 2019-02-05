# Mercari DB
#### ※F = null: false, T = null: ture, uni = unique: true, fk = foregin_key: true, ai = add_index, afk = add_foreign_key

## 1.user
|Column|Type|Null|Option|
|------|----|----|------|
|last_name|str|F||
|first_name|str|F||
|last_name_kana|str|F||
|first_name_kana|str|F||
|phone|int|F|uni|
|paying-way|int|F||
|birth_y|int|F||
|birth_m|int|F||
|birth_d|int|F||
|mail|str|F|uni|
|password|str|F|uni|
|nickname|str|F|uni|
|comment|text|T||
|avatar|text|T||
### Association
- has_many :addresses, dependent: :destroy
- has_many :order_status
- has_many :items
- has_many :comments
- has_many :favorite-items, dependent: :destroy
- has_many :point_records
- has_many :money_records
- has_many :user-evaluations
- has_many :follow-relationships, dependent: :destroy
- has_many :followings, through: :follow-relationships, source: :follow
- has_many :reverse-follow-relationships, class_name: 'follow-relationship', foreign_key: 'following_id'
- has_many :followeds, through: :reverse-follow-relationships, source: :user
- has_many :block-relationship, dependent: :destroy
- has_many :blockings, through: :block-relationships, source: :block
- has_many :reverse-block-relationships, class_name: 'block-relationship', foreign_key: 'blocking_id'
- has_many :blockeds, through: :reverse-block-relationships, source: :user
### Option
- paying-wayカラムはenumで管理


## 2.address
|Column|Type|Null|Option|
|------|----|----|------|
|postal_code|int|F||
|region_id|ref|F|fk|
|city|str|F||
|block|str|F||
|building|str|T||
|user_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :region

## 3.region
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F|uni|
|parent_id|int|T||
### Association
- has_many :addresses
- has_many :items

## 4.follow-relationship
|Column|Type|Null|Option|
|------|----|----|------|
|following_id|int|F|afk/ai|
|followed_id|int|F|afk/ai|
### Association
belongs_to :user
belongs_to :follow, class_name: 'User'
### Validation
validates :user_id, presence: true
validates :follow_id presence: true
### Option
t.index [:user_id, :follow_id], unique: true

## 5.point-transaction-record
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|point|int|F||
|order-status-id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :order-status

## 6.money-transaction-record
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|money|int|F||
|order-status_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :order-status

## 7.block-relationship
|Column|Type|Null|Option|
|------|----|----|------|
|blocking_id|int|F|afk/ai|
|blocked_id|int|F|afk/ai|
### Association
belongs_to :user
belongs_to :block, class_name: 'User'
### Validation
validates :user_id, presence: true
validates :block_id presence: true
### Option
t.index [:user_id, :block_id], unique: true

## 8.user-evaluation
|Column|Type|Null|Option|
|------|----|----|------|
|high_count|tinyint|T||
|medium_count|tinyint|T||
|low_count|tinyint|T||
|evaluating_id|int|F|afk/ai|
|evaluated_id|int|F|afk/ai|
|comment|text|T||
### Association
- belongs_to :user

## 9.favorite-item
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|item_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :item
### Option
- t.index [:user_id, :item_id], unique: true

## 10.order-status
|Column|Type|Null|Option|
|------|----|----|------|
|purchaser_id|int|F|afk/ai|
|seller_id|int|F|afk/ai|
|status|int|F|| (※enumで管理 例：1→orderd等)
|item_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :item
- has_one :point_record
- has_one :money_record
### Option
- statusはenumで管理（例：1→orderd等)

## 11.comment
|Column|Type|Null|Option|
|------|----|----|------|
|content|text|F||
|item_id|ref|F|fk|
|user_id|ref|F|fk|
### Association
- belongs_to :item
- belongs_to :comment

## 12.item
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|T||
|comment|text|T||
|category_id|ref|F|fk|
|brand_id|int|T|fk|
|shipping_fee|bln|F||
|region_id|ref|F|fk|
|days_to_ship|int|F||
|price|int|F||
|condition|int|F||
|user_id|ref|F|fk|
|closed|bln|F|default:false|
### Association
- has_many :item-photos
- has_many :comments
- has_many :order-statuses
- belongs_to :region
- belongs_to :user
- belongs_to :category
- belongs_to :item
### Option
- conditionカラムはenumで管理
- days-to-shipカラムはenumで管理

## 13.item-photo
|Column|Type|Null|Option|
|------|----|----|------|
|image|str|F||
|item_id|ref|F|fk|
### Association
- belongs_to :item

## 14.category
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F||
|parent_id|int|T||
### Association
- has_many :items

## 15.brand
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F||
|parent_id|int|T||
### Association
- has_many :items


# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_04_054653) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "item_photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_photos_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "comment", null: false
    t.integer "category_id", default: 1, null: false
    t.integer "brand_id", default: 1
    t.boolean "shipping_fee", null: false
    t.integer "prefecture", null: false
    t.integer "days_to_ship", null: false
    t.integer "price", null: false
    t.integer "condition", null: false
    t.boolean "closed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "phone", null: false
    t.integer "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "block", null: false
    t.string "building"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.text "avatar"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "birth_y", null: false
    t.integer "birth_m", null: false
    t.integer "birth_d", null: false
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "item_photos", "items"
  add_foreign_key "profiles", "users"
end
