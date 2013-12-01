class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
    extras = :name, :address_street, :address_locality, :address_region, :address_postcode, :gift_code
    devise_parameter_sanitizer.for(:sign_up) << extras
    devise_parameter_sanitizer.for(:account_update) << extras
  end
 
  def require_login!
    redirect_to new_user_session_path unless signed_in?
  end
  
  def price_string(months, organic = false)
    "%.2f" % Pod.price(months: months, organic: organic)
  end
  helper_method :price_string

end
