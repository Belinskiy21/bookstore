class ReviewDecorator < Draper::Decorator
  delegate_all

  def created_at
    object.created_at.strftime('%D')
  end

  def content
    object.content
  end

  def book_rate
    stars = "<div class='mb-15'>" +
            "<i class='fa fa-star rate-star'></i>" * object.rate +
            "<i class='fa fa-star rate-star rate-empty'></i>" * (5 - object.rate) +
            '</div>'
    stars.html_safe
  end

  def user_avatar
    with_image = "<img class='img-circle logo-size inlide-block pull-left' src='#{object.user.image}'>".html_safe
    return with_image if object.user.image
    letter = object.user.email[0].upcase
    "<span class='img-circle logo-size inlide-block pull-left logo-empty'>#{letter}</span>".html_safe
  end

  def user_name
    try_any_name || "#{user.email.split('@').first.capitalize}"
  end

  def status_name
    if object.status
      I18n.t('approved')
    else
      object.status.nil? ? I18n.t('unprocessed') : I18n.t('rejected')
    end
  end

  def verified?
    OrderItem.where(
      book_id: object.book_id,
      order_id: object.user.orders.where(order_state: 'delivered').ids
    ).any?
  end

  private

  def try_any_name
    return get_name(object.user) if object.user.name
    get_name(object.user.addresses.billing.first) unless object.user.addresses.empty?
  end

  def get_name(subject)
    subject.name[0].upcase + '. ' + subject.name[1].capitalize
  end
end
