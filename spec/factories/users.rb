FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    password '123!@#$GGGddd'
    confirmed_at 7.days.ago
  end
end
