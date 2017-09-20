module BooksHelper

  def img_of(book)
    book.images.first.try(:file) || default_image
  end

  def small_img_of(book)
    book.images.first.file.thumb.url || default_image
  end

  def go_back_url
    @back || :back
  end

  private

  def default_image
    'default_img.png'
  end
end
