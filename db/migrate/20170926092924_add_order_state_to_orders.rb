class AddOrderStateToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_state, :string
  end
end
