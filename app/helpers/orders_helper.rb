module OrdersHelper
  def secret_card_number
    '** ** ** ' + current_order.credit_card.number.last(4)
  end

  def number
    id = @order.id.to_s
    template = 'N0000000'
    template[0..-id.size] + id
  end

  def sharp_number
    "#{I18n.t('order')} ##{number}"
  end
end
