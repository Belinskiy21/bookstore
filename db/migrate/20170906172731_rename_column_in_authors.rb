class RenameColumnInAuthors < ActiveRecord::Migration[5.1]
  def change
    rename_column :authors, :first_name, :name
  end
end
