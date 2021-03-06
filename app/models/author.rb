class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books
  validates :name, presence: true, uniqueness: true
end
