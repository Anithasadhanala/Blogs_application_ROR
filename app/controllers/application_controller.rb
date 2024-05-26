class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  
  # returns the current user checking from the sessions
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


  # method for user loggin or not
  def logged_in?
    !!current_user
  end

  # method for authentication check
  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "You must be logged in to access this page."
    end
  end

  
end
