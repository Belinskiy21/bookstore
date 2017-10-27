FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'F4k3p455w0rd'
    confirmed_at 7.days.ago
  end
end
