class OrdersController < ApplicationController
  def show
    #code
  end

  private

  def order_params
    params.require(:order).permit(:number, :creation_date)
  end
end
