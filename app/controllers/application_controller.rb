class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :answer_path
  before_filter :authenticate

  def answer_path(obj)
    if obj.is_a?(Answer)
      super(obj.url)
    else
      super(obj)
    end
  end

  private
    def authenticate
      return true unless request.path_info.include?("/admin/")
      authenticate_or_request_with_http_basic do |user, pass|
        user = LOGIN
        pass = LOGINPASS
      end
    end
end
