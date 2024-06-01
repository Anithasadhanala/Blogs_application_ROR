class ApplicationController < ActionController::Base

  # Making the current_user and logged_in? methods available to views
  helper_method :current_user, :logged_in?

  # Returns the current user by checking the session and ensuring the user is active and the session is not expired
  def current_user
    if session[:user_session_id]
      session_data = ActiveSession.find_by(session_id: session[:user_session_id], active: true)
      if session_data && Time.current < session_data.expires_at
      @current_user ||= User.find_by(id: session_data.user_id)

      else
        session[:user_session_id] = nil
        @current_user = nil
      end
    end
  end

  # Checks if a user is logged in
  def logged_in?
    !!current_user
  end

  # Ensures the user is authenticated before allowing access to certain actions
  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: "You must be logged in to access this page."
    end
  end
end
