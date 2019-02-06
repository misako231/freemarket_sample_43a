class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # enum prefecture: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukusima, :ibaragi, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :nigata, :toyama, :isikawa, :fukui, :yamanashi, :nagano, :gifu, :sizuoka, :aichi, :mie, :siga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :simane, :okayama, :hiroshima, :yamaguchi, :tokusima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :undecided]
end
