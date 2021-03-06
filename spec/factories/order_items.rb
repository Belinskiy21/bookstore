FactoryGirl.define do
  factory :order_item do
    transient do
      book
    end
    order
    unit_price 1.0
    quantity 1
    total_price 1.0

    factory :order_item_best_sellers do
      before(:create) do |order_item, evaluator|
        order_item.book= evaluator.book if evaluator.book
        order_item.order= FactoryGirl.create(:order)
      end
    end
  end
end
