class Category < ApplicationRecord
  has_ancestry
  has_many :items

  SIZE_GROUP = ["洋服のサイズ", "メンズ靴のサイズ", "レディース靴のサイズ", "スカートのサイズ", "キッズ服のサイズ", "ベビー・キッズ服のサイズ", "ベビー服のサイズ", ]
end
