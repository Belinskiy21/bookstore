module ApplicationHelper
  def authors_name_select(book)
    first_name = ''
    last_name = ''
    first_name = book.authors.pluck(:first_name).join(', ')
    last_name = book.authors.pluck(:last_name).join(', ')
    first_name + ' ' + last_name
  end
end
