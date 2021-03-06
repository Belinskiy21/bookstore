class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @books = @category.books.page(params[:page])
    @order_item = OrderItem.new
    @book_count = Book.all.count
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
