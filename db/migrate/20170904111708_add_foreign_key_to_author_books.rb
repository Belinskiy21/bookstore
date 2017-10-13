class AddForeignKeyToAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :author_books, :authors
    add_foreign_key :author_books, :books
  end
end
