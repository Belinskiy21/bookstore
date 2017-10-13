class AddColumnToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_column :coupons, :order_id, :integer
    add_index :coupons, :order_id
  end
end
