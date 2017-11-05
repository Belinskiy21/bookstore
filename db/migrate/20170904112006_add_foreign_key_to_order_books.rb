class AddForeignKeyToOrderBooks < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :order_books, :orders
    add_foreign_key :order_books, :books
  end
end
