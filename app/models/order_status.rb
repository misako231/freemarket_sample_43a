class OrderStatus < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_one :point_record
end
