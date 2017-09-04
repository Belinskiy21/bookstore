module ApplicationHelper
  def authors_to_list(book)
    book.authors.pluck(:name).join(', ')
  end
end
