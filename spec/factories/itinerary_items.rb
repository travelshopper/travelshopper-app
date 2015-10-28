FactoryGirl.define do
  factory :itinerary_item do
    date '2015-10-27'
    start_time '2015-10-27 23:52:24'
    end_time '2015-10-27 23:52:24'
    city 'MyString'
    place 'MyString'
    itinerary

    trait :blank_date do
      date ''
    end
  end
end
