class BooksController < ApplicationController

  def index
    @books = Book.all.page(params[:page])
    @order_item = current_order.order_items.new
    @book_count = Book.all.count
  end

  def show
    @book = Book.find_by_id(params[:id])
    redirect_to root_url, alert: 'No such book.' unless @book
    @order_item = OrderItem.new
    @reviews = @book.reviews.approved.decorate
  end

  def newest_first
    @books = Book.newest_first.page(params[:page])
    render action: :index
  end

  def popular_first
    @books = Book.popular_first.page(params[:page])
    render action: :index
  end

  def price_descending
    @books = Book.price_descending.page(params[:page])
    render action: :index
  end

  def price_ascending
    @books = Book.price_ascending.page(params[:page])
    render action: :index
  end

  def title_descending
    @books = Book.title_descending.page(params[:page])
    render action: :index
  end

  def title_ascending
    @books = Book.title_ascending.page(params[:page])
    render action: :index
  end
end
