FactoryBot.define do
    factory :user do
    sequence(:name){|n| "name_#{n}"}
    sequence(:email) { |n| "#{n}@example.com"}

    password = Faker::Internet.password(8)
    name Faker::Name.last_name
    email Faker::Internet.free_email
    password password
    password_confirmation password
  end
end
