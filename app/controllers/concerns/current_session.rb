module CurrentSession
  thread_mattr_accessor :user
  attr_reader :back

  extend ActiveSupport::Concern
  included do
    helper_method :set_back_path
    # around_action :set_current_user
  end

  def set_current_user
    CurrentSession.user = current_user
    yield
  ensure
    CurrentSession.user = nil
  end

  def set_back_path
    @back = session[:previous_request_url]
  end
end
