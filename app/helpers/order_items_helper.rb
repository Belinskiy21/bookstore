module OrderItemsHelper
  def order_items_quantity
    current_order.order_items.collect { |item| item.quantity }.sum
  end
end
