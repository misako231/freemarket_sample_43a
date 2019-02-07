class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :item_photos
  accepts_nested_attributes_for :item_photos, allow_destroy: true
  belongs_to :user
  belongs_to :category
  validates :name,           presence: true, length: { maximum: 40 }
  validates :comment,        presence: true, length: { maximum: 1000 }
  validates :category_id,    presence: true
  # validates :shipping_fee,   inclusion: { in: [true, false] }
  validates :prefecture,     presence: true
  validates :days_to_ship,   presence: true
  # validates :price,          numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :condition,      presence: true

  enum condition: [:new_item, :close_to_the_unused, :no_noticeable_scratches_and_dirt, :a_few_scratches_and_dirt, :scratches_and_dirt, :bad]
  enum shipping_fee: { self: false, other: true }
  enum days_to_ship: [:fast, :normal, :slow]

  scope :with_category, -> { joins(:category) }
  scope :search_with_root_id, ->(root_id) { where("ancestry LIKE ?", "#{root_id}/") }
end
