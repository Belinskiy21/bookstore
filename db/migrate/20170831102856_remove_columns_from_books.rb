class RemoveColumnsFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :checkbox, :boolean
    remove_column :books, :image, :string
  end
end
