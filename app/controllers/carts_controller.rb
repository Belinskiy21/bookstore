class CartsController < ApplicationController
  def show
    @current_order = current_order
  end

  def update
    @order = current_order
    @order.coupon = Coupon.where(code: params[:coupon_code]).last
    @order.save
    flash[:alert] = I18n.t('wrong_coupon') if @order.coupon.nil?
    redirect_to cart_path
  end
end
