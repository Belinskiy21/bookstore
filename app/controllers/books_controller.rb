class BooksController < ApplicationController

  def index

  end

  def show
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id, :description, :price, :year_of_publication, :dimensions, :materials)
  end
end
