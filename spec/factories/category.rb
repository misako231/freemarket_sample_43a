FactoryBot.define  do
  factory :category do
    sequence(:id) {|n| n}
    name {"mens"}
    ancestry {}

    # after(:create) do |category|
    #   create_list(:item, 1, category: category)
    # end

  end
end
