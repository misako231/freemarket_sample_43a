FactoryBot.define  do
  factory :item do
    name {Faker::Name.name}
    comment {"good"}
    prefecture_id {1}
    days_to_ship {1}
    price {2000}
    condition {"new_item"}
    shipping_fee {"self"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    user
    category
  end
end
