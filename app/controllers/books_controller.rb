class BooksController < ApplicationController

  def index
    @books = Book.all.page(params[:page])
    @book_count = Book.all.count
  end

  def show

  end

end
