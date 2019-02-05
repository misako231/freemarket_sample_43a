FactoryBot.define  do
  factory :item_photo do
    item_id {Faker::Number.number(1)}
    image {fixture_file_upload("test/fixtures/test_book.jpg", 'image/jpg')}
  end
end
