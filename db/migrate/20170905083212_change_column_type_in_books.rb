class ChangeColumnTypeInBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :price, :decimal
  end
end
