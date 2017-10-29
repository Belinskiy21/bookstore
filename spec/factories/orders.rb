FactoryGirl.define do
  factory :order do
    user
    shipping_method_id 1
    credit_card_id nil
  end
end
