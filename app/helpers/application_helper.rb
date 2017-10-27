module ApplicationHelper
  def authors_name_select(book)
    book.authors.pluck(:name).join(', ')
  end

  def active_class(link_path)
   return '' if request.GET.empty?
   (link_path.include? request.GET.first.join('=')) ? 'active' : ''
   # current_page?(link_path) ? 'active' : ''
  end
end
