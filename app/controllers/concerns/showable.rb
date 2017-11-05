module Showable
  extend ActiveSupport::Concern

  included do
    private

    def show_addresses
      @addresses = AddressesForm.new(show_addresses_params)
    end

    def show_delivery
      return jump_to(previous_step) unless current_order.addresses.presence
      @shipping_methods = ShippingMethod.all
    end

    def show_payment
      return jump_to(previous_step) unless current_order.shipping_method
      @credit_card = current_order.credit_card || CreditCard.new
    end

    def show_confirm
      return jump_to(previous_step) unless current_order.credit_card_id
      show_addresses
    end

    def show_complete
      return jump_to(previous_step) unless flash[:complete_order]
      @order = current_user.orders.where(order_state: 'processing').order('updated_at').last
    end

    def show_addresses_params # take data from settings if persist
      return { user_id: current_user.id } if current_order.addresses.empty?
      { order_id: current_order.id }
    end
  end
end
