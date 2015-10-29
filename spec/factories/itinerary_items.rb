FactoryGirl.define do
  factory :itinerary_item do
    date Date.current + 1.day
    start_time Date.current + 1.day
    end_time Date.current + 2.days
    city 'MyString'
    place 'MyString'
    itinerary

    trait :blank_date do
      date ''
    end
  end
end
