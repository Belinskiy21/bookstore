module CurrentSession
  thread_mattr_accessor :user
  attr_reader :back

  extend ActiveSupport::Concern
  included do
    helper_method :set_back_path
  end

  def set_back_path
    @back = session[:previous_request_url]
  end
end
