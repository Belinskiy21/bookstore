class OrdersController < ApplicationController

  private

  def order_params
    params.require(:order).permit(:number, :creation_date)
  end
end
