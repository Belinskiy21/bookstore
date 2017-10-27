class OrderItemsController < ApplicationController
  before_action :set_current_order

  def create
    @order_item = @order.order_items.find_by(book_id: params[:order_item][:book_id])
    if @order_item
      @order_item.update_attribute(:quantity, @order_item.quantity + params[:order_item][:quantity].to_i)
      redirect_back fallback_location: book_path(params[:order_item][:book_id]), notice: 'Book was added to you order!'
    else
      @order_item = @order.order_items.new(order_items_params)
      @order.user = current_user if user_signed_in?
      @order.save
      redirect_back fallback_location: book_path(params[:order_item][:book_id]), notice: 'Book was added to you order!'
    end
    session[:order_id] = @order.id
    respond_to do |format|
      format.html do
        redirect_back fallback_location: book_path(params[:order_item][:book_id]), notice: 'Book was added to you order!'
      end
      format.js
    end
  end

  def destroy
    @order_items = @order.order_items
    @order_items.find(params[:id]).destroy
    redirect_to cart_path, notice: 'Item was deleted!'
  end

  def update
   @order_item = @order.order_items.find(params[:id])
   @order_item.update_attribute(:quantity, params[:quantity].to_i )
   respond_to do |format|
     format.js
     redirect_to cart_path, notice: 'Cart was updated!'
    end
  end

  private

  def order_items_params
    params.require(:order_item).permit(:book_id, :quantity)
  end

  def set_current_order
    @order = current_order
  end
end
