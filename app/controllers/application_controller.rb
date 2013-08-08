class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login!
    redirect_to new_user_registration_path unless signed_in?
  end
  
end
