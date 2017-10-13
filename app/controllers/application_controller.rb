class ApplicationController < ActionController::Base
  include CurrentSession
  protect_from_forgery with: :exception
  before_action :categoriesall
  before_action :set_back_path

  # def after_sign_in_path_for(resource)
  #   checkout_index_path if request.referrer == cart_path(:order_id)
  # end

  def categoriesall
    @categoriesall = Category.all
  end

  helper_method :current_order

  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.where(id: session[:order_id]).last || Order.new
    end
  end
end
