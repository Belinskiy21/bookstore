class BooksController < ApplicationController

  def index
     @book = Book.all
  end

  def show

  end

end
