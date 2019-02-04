FactoryBot.define  do
  factory :item do
    name {"coachbag"}
    image {File.open("#{Rails.root}/public/images/test_dolphin.jpg")}
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
      create_list(:item_photoes, 1, item:item)
    end

  end
end
