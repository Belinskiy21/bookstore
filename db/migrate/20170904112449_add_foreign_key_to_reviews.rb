class AddForeignKeyToReviews < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :books
  end
end
