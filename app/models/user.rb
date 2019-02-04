class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  validates :nickname,               presence: true, length: { maximum: 20 }
  validates :password,               length: { maximum: 128 }
  validates :email,                  format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/,
                                              message: 'のフォーマットが不適切です' }
  validates :password_confirmation,  presence: true
  validates :last_name,              presence: true, length: { maximum: 35 }
  validates :first_name,             presence: true, length: { maximum: 35 }
  validates :last_name_kana,         presence: true, length: { maximum: 35 },
                                     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカナ文字で入力してください' }
  validates :first_name_kana,        presence: true, length: { maximum: 35 },
                                     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカナ文字で入力してください' }
  validates :birth_d,                presence: true

  def self.years
   years = []
   for year in 1900..2019 do
     years << year
   end
   return years
  end

  def self.months
   months = []
   for month in 1..12 do
     months << month
   end
   return months
  end

end
