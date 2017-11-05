class AddIndexToOrderBooks < ActiveRecord::Migration[5.1]
  def change
    add_index :order_books, :book_id
    add_index :order_books, :order_id
  end
end
