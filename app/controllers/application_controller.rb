class ApplicationController < ActionController::Base
  include CurrentSession
  protect_from_forgery with: :exception
  before_action :categoriesall
  before_action :set_back_path

def categoriesall
  @categoriesall = Category.all
end

end
