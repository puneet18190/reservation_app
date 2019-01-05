FactoryBot.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant-#{n}" }
    email { Faker::Internet.email }
    phone "9876543210"
  end
end
