FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.user_name(1..20)}
    email {Faker::Internet.free_email }
    password = Faker::Internet.password(6, 128)
    password { password }
    password_confirmation { password }
    last_name { Faker::Name.first_name }
    first_name {Faker::Name.last_name}
    last_name_kana {'ヤマダ'}
    first_name_kana {'ツヨシ'}
    birth_y {Faker::Number.between(1990, 2019)}
    birth_m {Faker::Number.between(01, 12)}
    birth_d {Faker::Number.between(01, 31)}
  end
end

