FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Josh Man #{n}" }
    sequence(:email) { |e| "football#{e}@gmail.com" }
    password "ballislife"
  end
end
