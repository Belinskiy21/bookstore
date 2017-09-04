class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :categories

def categories
  @categoriesall = Category.all
end

end
