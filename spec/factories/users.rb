FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "User#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password  { "password" }
  end
end