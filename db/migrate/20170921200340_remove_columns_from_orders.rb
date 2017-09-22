class RemoveColumnsFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :number, :integer
    remove_column :orders, :creation_date, :string
  end
end
