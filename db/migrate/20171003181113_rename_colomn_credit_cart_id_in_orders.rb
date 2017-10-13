class RenameColomnCreditCartIdInOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :credit_cart_id, :credit_card_id
  end
end
