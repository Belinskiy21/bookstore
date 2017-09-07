class BooksController < ApplicationController

  def index
    @books = Book.all
    @book_count = @books.count
  end

  def show

  end

end
