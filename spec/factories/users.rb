FactoryGirl.define do
  factory :user do
    email 'user@ts.com'
    password 'password'
    password_confirmation 'password'
  end
end
