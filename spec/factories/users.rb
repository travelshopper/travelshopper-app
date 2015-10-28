FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@ts.com" }
    password 'password'
    password_confirmation 'password'
  end
end
