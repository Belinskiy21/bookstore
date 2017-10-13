class OrdersController < ApplicationController
  
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @orders = Order.all
  end

  def in_progress
    @orders = Order.in_progress.where(user_id: current_user.id)
    render action: :index
  end

  def processing
    @orders = Order.processing.where(user_id: current_user.id)
    render action: :index
  end

  def in_delivery
    @orders = Order.in_delivery.where(user_id: current_user.id)
    render action: :index
  end

  def delivered
    @orders = Order.delivered.where(user_id: current_user.id)
    render action: :index
  end

  def canceled
    @orders = Order.canceled.where(user_id: current_user.id)
    render action: :index
  end
  private

  def order_params
    params.require(:order).permit(:number, :user_id, :order_state, :credit_card_id, :shipping_method_id)
  end
end
