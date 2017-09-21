class BooksController < ApplicationController

  def index
    @books = Book.all.page(params[:page])
    @book_count = Book.all.count
  end

  def show
    @book = Book.find_by_id(params[:id])
    redirect_to root_url, alert: 'No such book.' unless @book
    @order_item = OrderItem.new
  end

end
