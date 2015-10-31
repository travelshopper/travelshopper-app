FactoryGirl.define do
  factory :wish_item_image do
    image Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.png'))
    wish_item
  end
end
