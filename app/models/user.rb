class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,        presence: true, length: { maximum: 20 }
  validates :password,        presence: true, length: { in: 6..128 }
  validates :last_name,       presence: true, length: { maximum: 35 }
  validates :first_name,      presence: true, length: { maximum: 35 }
  validates :last_name_kana,  presence: true, length: { maximum: 35 },
                             format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :first_name_kana, presence: true, length: { maximum: 35 },
                             format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }

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
