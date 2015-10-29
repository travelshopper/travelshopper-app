FactoryGirl.define do
  factory :wish_item do
    description 'MyText'
    itinerary_item

    trait :blank_description do
      description ''
    end
  end
end
