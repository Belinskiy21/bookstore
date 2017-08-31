class CreateOrderBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :order_books do |t|
      t.integer :order_id
      t.integer :book_id

      t.timestamps
    end
  end
end
