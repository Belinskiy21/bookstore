class RenameTableOrderBooks < ActiveRecord::Migration[5.1]
  def change
    rename_table :order_books, :order_items
  end
end
