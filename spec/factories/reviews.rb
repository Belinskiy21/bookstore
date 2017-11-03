FactoryGirl.define do
  factory :review do

    status true
    rate 5
    content 'review content'
    association :user
    association :book
  end
end
