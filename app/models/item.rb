class Item < ApplicationRecord
  has_many :itme_photos
  accepts_nested_attributes_for :itme_photos, allow_destroy: true
  belongs_to :user
  # belongs_to :category

  enum condition: [:new_item, :close_to_the_unused, :no_noticeable_scratches_and_dirt, :a_few_scratches_and_dirt, :scratches_and_dirt, :bad]
  enum shipping_fee: { self: false, other: true }
  enum days_to_ship: [:fast, :normal, :slow]
  enum prefecture: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukusima, :ibaragi, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :nigata, :toyama, :isikawa, :fukui, :yamanashi, :nagano, :gifu, :sizuoka, :aichi, :mie, :siga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :simane, :okayama, :hiroshima, :yamaguchi, :tokusima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :undecided]
end
