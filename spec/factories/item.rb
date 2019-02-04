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
    # item.paying-way.user_id {"1"}
    # item.paying-way.way {"1"}
  end
end
