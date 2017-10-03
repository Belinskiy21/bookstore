class OrdersController < ApplicationController
  def show
    #code
  end

  private

  def order_params
    params.require(:order).permit(:number, :user_id, :order_state, :credit_card_id, :shipping_method_id)
  end
end
