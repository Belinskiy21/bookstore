module CurrentSession
  # thread_mattr_accessor :user
  attr_reader :back

  extend ActiveSupport::Concern
  included do
    helper_method :set_back_path

    def after_sign_in_path_for(resource)
      if params[:redirect_to].present?
        store_location_for(resource, params[:redirect_to])
      elsif request.referer == new_user_session_path
        super
      else
        root_path
      end
    end
  end

  def set_back_path
    @back = session[:previous_request_url]
  end
end
