#Mercari DB
###※F = null: false, T = null: ture, uni = unique: true, fk = foregin_key: true, ix = add_index, adf = add_foreign_key

##Usersテーブル
|Column|Type|Null|Option|
|------|----|----|------|
|last_name|str|F||
|first_name|str|F||
|last_name_kana|str|F||
|fisrt_name_kana|str|F||
|phone|int|U||
|paying_way|int|F||
|birth_y|int|F||
|birth_m|int|F||
|birth_d|int|F||
|mail|str|U||
|password|str|F|U|
|nickname|str|F||
|comment|text|T||
|avatar|text|T||


##card
|Column|Type|Null|Option|
|------|----|----|------|
|card_info|??|U||
|user_id|ref|F||

##region
|Column|Type|Null|Option|
|------|----|----|------|
|name|str|F|uni|
|parent_id|int|T||

##follow
|Column|Type|Null|Option|
|------|----|----|------|
|following_id|int|F|adf|
|followed_id|int|F|adf|

##wallet???
|Column|Type|Null|Option|
|------|----|----|------|
|user_id|ref|F|fk|

##point_record
|Column|Type|Null|Option|
|------|----|----|------|
|wallet_id|ref|F|fk|
|point|int|F||
|order_status_id|int|F|fk|

##money
|Column|Type|Null|Option|
|------|----|----|------|
|wallet_id|ref|F|fk|
|money|int|F||
|order_status_id|int|F|fk|

##block
|Column|Type|Null|Option|
|------|----|----|------|
|blocking_id|int|F|adf|
|blocked_id|int|F|adf|

##user_evaluation
|Column|Type|Null|Option|
|------|----|----|------|
|high_count|int|T|[1]|
|medium_count|int|T|[1]|
|low_count|int|T|[1]|
|evaluating_id|int|
