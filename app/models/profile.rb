class Profile < ApplicationRecord
  enum prefecture: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukusima, :ibaragi, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :nigata, :toyama, :isikawa, :fukui, :yamanashi, :nagano, :gifu, :sizuoka, :aichi, :mie, :siga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :simane, :okayama, :hiroshima, :yamaguchi, :tokusima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :undecided]
  belongs_to :user

  enum prefecture: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukusima, :ibaragi, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :nigata, :toyama, :isikawa, :fukui, :yamanashi, :nagano, :gifu, :sizuoka, :aichi, :mie, :siga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :simane, :okayama, :hiroshima, :yamaguchi, :tokusima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :undecided]

  validates :prefecture,      presence: true
  validates :phone,           presence: true, length: { minimum: 10, maximum: 16 },
                              numericality: { only_integer: true }
  validates :postal_code,     presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :city,            presence: true, length: { maximum: 35 }
  validates :block,           presence: true, length: { maximum: 35 }
  validates :building,        length: { maximum: 35 }
  validates :user_id,         uniqueness: true
end
