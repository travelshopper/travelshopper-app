FactoryGirl.define do
  factory :itinerary do
    start_date Date.current + 1.day
    end_date Date.current + 2.days
    country_code 'MY'
    user

    trait :invalid_start_date do
      start_date Date.current
    end
  end
end
