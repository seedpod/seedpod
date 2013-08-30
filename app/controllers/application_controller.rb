class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
    extras = :name, :address_street, :address_locality, :address_region, :address_postcode
    devise_parameter_sanitizer.for(:sign_up) << extras
    devise_parameter_sanitizer.for(:account_update) << extras
  end
 
  def require_login!
    redirect_to new_user_registration_path unless signed_in?
  end
  
end
