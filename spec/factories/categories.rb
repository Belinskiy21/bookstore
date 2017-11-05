FactoryGirl.define do
  factory :category do
    transient do
      type { FFaker::Lorem.phrase }
    end

    sequence(:name) { |i| FFaker::Lorem.phrase + i.to_s }

    after(:create) do |category, evaluator|
      category.name= evaluator.type
      category.save
    end
  end
end
