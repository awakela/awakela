# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :set_current_user_session
  helper :all # include all helpers, all the time
	
	SERVER_TIMEZONE = 'Beijing' # please also update the config/environment.rb
	
  # See ActionController::RequestForgeryProtection for details
  protect_from_forgery 

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

protected
  
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
  
  def current_user
		@current_user
  end
	
  
  helper_method :logged_in?
  helper_method :current_user
private
	
	def set_current_user_session
		@current_user = User.find_by_id(session[:user_id]) if session[:user_id]
		Time.zone = @current_user.timezone if @current_user
	end
end
