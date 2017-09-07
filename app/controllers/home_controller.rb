class HomeController < ApplicationController

  def index
    @books = Book.all.page(params[:page]).per(4)
  end
end
