class Author < ApplicationRecord
  has_many :books, throgh: :author_books
  has_many :author_books, dependent: :destroy

end
