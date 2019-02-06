class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :prefecture_id,      presence: true
  validates :phone,           presence: true, length: { minimum: 10, maximum: 16 },
                              numericality: { only_integer: true }
  validates :postal_code,     presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :city,            presence: true, length: { maximum: 35 }
  validates :block,           presence: true, length: { maximum: 35 }
  validates :building,        length: { maximum: 35 }
  validates :user_id,         uniqueness: true
end
