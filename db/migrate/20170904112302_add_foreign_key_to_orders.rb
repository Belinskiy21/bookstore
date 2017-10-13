class AddForeignKeyToOrders < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :orders, :users
  end
end
