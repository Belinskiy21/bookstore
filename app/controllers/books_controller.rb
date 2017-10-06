class BooksController < ApplicationController

  def index
    @books = Book.all.page(params[:page])
    @book_count = Book.all.count
    @order_item = current_order.order_items.new
  end

  def show
    @book = Book.find_by_id(params[:id])
    redirect_to root_url, alert: 'No such book.' unless @book
    @order_item = OrderItem.new
    @reviews = @book.reviews.approved.decorate
  end

end
