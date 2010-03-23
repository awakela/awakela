# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :fetch_logged_in_user
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  protect_from_forgery 

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

protected
  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
  end
  
  def logged_in?
    ! @current_user.nil?
  end

  def login_required
    return true if logged_in?
    session[:return_to] = request.request_uri
    redirect_to new_session_path and return false
  end
  
  def sign_in(user)
	@current_user = user
    if @current_user
      session[:user_id] = @current_user.id
	end
	@current_user
  end

  helper_method :logged_in?
end
