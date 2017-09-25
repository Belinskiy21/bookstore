class HomeController < ApplicationController

  def index
    @books = Book.all.page(params[:page]).per(4)
    @new_books = Book.includes(:authors).last 3
    @order_item = OrderItem.new
  end
end
