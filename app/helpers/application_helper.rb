module ApplicationHelper
  def authors_name_select(book)
    book.authors.pluck(:name).join(', ')
  end
end
