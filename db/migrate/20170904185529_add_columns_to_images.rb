class AddColumnsToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :file, :string
    add_column :images, :book_id, :integer
    add_index :images, :book_id
  end
end
