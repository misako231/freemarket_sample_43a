class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :item_photos, dependent: :destroy
  has_many :favorite_items, dependent: :destroy
  has_many :comments,dependent: :destroy
  accepts_nested_attributes_for :item_photos, allow_destroy: true
  belongs_to :user
  belongs_to :category
  validates :name,           presence: true, length: { maximum: 40 }
  validates :comment,        presence: true, length: { maximum: 1000 }
  validates :category_id,    presence: true
  validates :shipping_fee,   presence: true
  validates :prefecture,     presence: true
  validates :days_to_ship,   presence: true
  validates :price,          numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
  validates :condition,      presence: true
  validates :item_photos,    presence: true
  enum condition: [:new_item, :close_to_the_unused, :no_noticeable_scratches_and_dirt, :a_few_scratches_and_dirt, :scratches_and_dirt, :bad]
  enum shipping_fee: { self: false, other: true }
  enum days_to_ship: [:fast, :normal, :slow]

  SORT = ["価格の安い順", "価格の高い順", "出品の古い順", "出品の新しい順", "いいね!の多い順"]
  SEARCH_PRICE = ["300 ~ 1000", "1000 ~ 5000", "5000 ~ 10000", "10000 ~ 30000", "30000 ~ 50000", "50000 ~"]

  def next_to_item(next_or_previous)
    if next_or_previous == "previous"
      Item.where('id < ?', self.id).order('id DESC').first
    else
      Item.where('id > ?', self.id).order('id ASC').first
    end
  end

  scope :with_category, -> { joins(:category) }
  scope :search_with_root_id, ->(root_id) { where("ancestry LIKE ?", "#{root_id}/%") }
  scope :new_arrival, -> { order('id DESC') }

  def self.create_charge_by_customer(price, user)
      Payjp::Charge.create(
        customer: user,
        amount:   price,
        currency: 'jpy',
      )
  end
end
