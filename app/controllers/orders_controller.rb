class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.all
  end

  def in_progress
    @orders = Order.in_progress
    render action: :index
  end

  def processing
    @orders = Order.processing
    render action: :index
  end

  def in_delivery
    @orders = Order.in_delivery
    render action: :index
  end

  def delivered
    @orders = Order.delivered
    render action: :index
  end

  def canceled
    @orders = Order.canceled
    render action: :index
  end
  private

  def order_params
    params.require(:order).permit(:number, :user_id, :order_state, :credit_card_id, :shipping_method_id)
  end
end
