FactoryBot.define  do
  factory :item do
    name {Faker::Name.name}
    comment {"good"}
    prefecture_id {1}
    category
    days_to_ship {1}
    price {2000}
    condition {"new_item"}
    shipping_fee {"self"}
    user

    after(:build) do |item|
      item.item_photos << create_list(:item_photo, 1, item:item)
    end
  end
end
