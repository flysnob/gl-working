FactoryGirl.define do
  factory :user do
    name 'Test User'
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'please123'

    factory :admin do
      trait :admin do
        role 'admin'
      end
    end
  end
end
