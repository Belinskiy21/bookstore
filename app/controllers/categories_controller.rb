class CategoriesController < ApplicationController

def index

end

def show
  @category = Category.find(params[:id])
  @books = @category.books

end
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
