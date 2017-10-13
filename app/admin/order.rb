ActiveAdmin.register Order do
  after_save do |order|
      event = params[:order][:active_admin_requested_event]
      unless event.blank?
        # whitelist to ensure we don't run an arbitrary method
        safe_event = (order.aasm.events(permitted: true).map(&:name) & [event.to_sym]).first
        raise "Forbidden event #{event} requested on instance #{order.id}" unless safe_event
        # launch the event with bang
        order.send("#{safe_event}!")
      end
    end

    index do
      id_column
      column :id
      column :user_id
      column :created_at
      column :updated_at
      column :order_state
      column :credit_card do |order|
        unless order.credit_card_id.nil?
          order.credit_card.number
        else
          'Not complited checkout!'
        end
      end
      column :shipping_method do |order|
        unless order.shipping_method_id.nil?
          order.shipping_method
        else
          'Not complited checkout!'
        end
      end
    end

    form do |f|
      f.inputs do
        f.input :order_state, input_html: { disabled: true }, label: 'Current state'
        f.input :active_admin_requested_event, label: 'Change state', as: :select, collection: f.object.aasm.events(permitted: true).map(&:name)
      end
    f.actions
  end
    # whitelist attribute with strong parameters
    permit_params :active_admin_requested_event, :user_id, :order_state, :credit_card_id, :shipping_method_id, :id

end
