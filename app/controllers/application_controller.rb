class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :categoriesall

def categoriesall
  @categoriesall = Category.all
end

end
