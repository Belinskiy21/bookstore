module BooksHelper

  def img_of(book, options = {})
    book.images.first.try(:file) || default_image
  end

  def small_img_of(book, options = {})
      book.images.last.file.thumb.url unless book.images.last.nil?
      default_image
  end

  def go_back_url
    @back || :back
  end

  private

  def default_image
    'jyljivokym3gdn1ezwan.jpg'
  end
end
