FactoryBot.define  do
  factory :item do
    name {"coachbag"}
    comment {"good"}
    category_id {"1"}
    prefecture {"1"}
    days-to-ship {"1"}
    price {"2000"}
    condition {"1"}
    shipping_fee {"1"}
    prefecture {"1"}
    days-to-ship {"1"}


    after(:build) do |item|
      create_list(:item_photo, 1, item:item)
    end

  end
end
