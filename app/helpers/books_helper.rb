module BooksHelper
  def img_of(book)
    book.images.first.file || default_image
  end
end
