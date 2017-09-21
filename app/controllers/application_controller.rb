class ApplicationController < ActionController::Base
  attr_accessor :order_id, :book_id
  include CurrentSession
  protect_from_forgery with: :exception
  before_action :categoriesall
  before_action :set_back_path

  def categoriesall
    @categoriesall = Category.all
  end

  private

  def current_order
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end
end
