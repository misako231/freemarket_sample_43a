FactoryBot.define  do
  factory :category do
    sequence(:id) {|n| n}
    name {"mens"}
    ancestry {}
  end
end
