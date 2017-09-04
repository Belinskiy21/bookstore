class AddIndexToAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    add_index :author_books, :book_id
    add_index :author_books, :author_id
  end
end
