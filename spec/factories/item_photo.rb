include ActionDispatch::TestProcess
FactoryBot.define  do
  factory :item_photo do
    image {fixture_file_upload("#{::Rails.root}/spec/fixtures/a.jpg", 'image/jpg')}
  end
end
