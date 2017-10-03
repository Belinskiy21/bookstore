class AddColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :credit_cart_id, :integer
    add_index :orders, :credit_cart_id
    add_column :orders, :shipping_method_id, :integer
    add_index :orders, :shipping_method_id
  end
end
