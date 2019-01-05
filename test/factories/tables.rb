FactoryBot.define do
  factory :table do
    sequence(:name) { |n| "Table-#{n}" }
    min_capacity 1
    max_capacity 10
    restaurant
  end
end
