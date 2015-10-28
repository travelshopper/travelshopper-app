FactoryGirl.define do
  factory :itinerary do
    start_date '2015-10-27'.to_date
    end_date '2015-10-27'.to_date
    country_code 'MY'
    user
  end
end
