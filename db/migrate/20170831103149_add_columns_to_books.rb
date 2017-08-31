class AddColumnsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :year_of_publication, :string
    add_column :books, :dimensions, :string
    add_column :books, :materials, :string
  end
end
