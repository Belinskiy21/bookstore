require 'ffaker'

FactoryGirl.define do
  factory :book do
    transient do
      cost 333.333
      category_name { FactoryGirl.create(:category).id }
    end

    price 1.0
    sequence(:title)  { |i| FFaker::Book.title + i.to_s }
    description FFaker::Book.description
    year_of_publication 2015
    dimensions 'h:23, w:120, d:23'
    materials 'soft cover'
    category

    before(:create) do |book, evaluator|
      book.category_id= (Category.find_by_name(evaluator.category_name) ||
        FactoryGirl.create(:category, type: evaluator.category_name)).id
    end
  end
end
