module CurrentSession
  # thread_mattr_accessor :user
  attr_reader :back

  extend ActiveSupport::Concern
  included do
    helper_method :set_back_path
  
    # def after_sign_in_path_for(resource)
    #   if cookies[:from_checkout]
    #     cookies.delete :from_checkout
    #     checkout_path(:addresses)
    #   else
    #     super
    #   end
    # end
  end

  def set_back_path
    @back = session[:previous_request_url]
  end
end
