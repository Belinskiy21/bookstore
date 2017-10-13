class AddIndexToBooks < ActiveRecord::Migration[5.1]
  def change
    add_index :books, :category_id
  end
end
