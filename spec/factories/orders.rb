FactoryGirl.define do
  factory :order do
    user
    shipping_method_id 1
    credit_card_id nil
    order_state 'in_progress'

    factory :order_processing do
      after :create do |order|
        order.update order_state: :processing
      end
    end

    factory :order_in_delivery do
      after :create do |order|
        order.update order_state: :in_delivery
      end
    end

    factory :order_delivered do
      after :create do |order|
        order.update order_state: :delivered
      end
    end

    factory :order_canceled do
      after :create do |order|
        order.update order_state: :canceled
      end
    end

  end
end
