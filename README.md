#Mercari DB
####※F = null: false, T = null: ture, uni = unique: true, fk = foregin_key: true, ai = add_index, afk = add_foreign_key

##1.user
|Column|Type|Null|Option|
|------|----|----|------|
|last_name|str|F||
|first_name|str|F||
|last_name_kana|str|F||
|first_name_kana|str|F||
|phone|int|F|uni|
|paying-way_id|ref|F|fk|
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
- belongs_to :paying-way


##2.address
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

##3.region
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F|uni|
|parent_id|int|T||
### Association
- has_many :addresses
- has_many :items

##4.follow-relationship
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

##5.point-transaction-record
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|point|int|F||
|order-status-id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :order-status

##6.money-transaction-record
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|money|int|F||
|order-status_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :order-status

##7.block-relationship
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

##8.user-evaluation
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

##9.favorite-item
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|
|item_id|ref|F|fk|
### Association
- belongs_to :user
- belongs_to :item
### Option
- t.index [:user_id, :item_id], unique: true

##10.order-status
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

##11.comment
|Column|Type|Null|Option|
|------|----|----|------|
|content|text|F||
|item_id|ref|F|fk|
|user_id|ref|F|fk|
### Association
- belongs_to :item
- belongs_to :comment

##12.paying_way
|Column|Type|Null|Option|
|------|----|----|------|
|way|str|F||
### Association
has_many :users

##13.item
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|T||
|comment|text|T||
|category_id|ref|F|fk|
|brand_id|int|T|fk|
|shipping_fee|bln|F||
|region_id|ref|F|fk|
|days_to_ship_id|ref|F|fk|
|price|int|F||
|condition-list_id|ref|F|fk|
|user_id|ref|F|fk|
|closed|bln|F|default:false|
### Association
- has_many :item-photos
- has_many :comments
- has_many :order-statuses
- belongs_to :region
- belongs_to :user
- belongs_to :category
- belongs_to :days-to-ship
- belongs_to :condition-list
- belongs_to :item

##14.item-photo
|Column|Type|Null|Option|
|------|----|----|------|
|image|str|F||
|item_id|ref|F|fk|
### Association
- belongs_to :item

##15.days-to-ship
|Column|Type|Null|Option|
|------|----|----|------|
|days|str|F||
### Association
- has_many :items

##16.condition-list
|Column|Type|Null|Option|
|------|----|----|------|
|status|str|F||
### Association
- has_many :items

##17.category
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F||
|parent_id|int|T||
### Association
- has_many :items

##18.brand
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F||
|parent_id|int|T||
### Association
- has_many :items
