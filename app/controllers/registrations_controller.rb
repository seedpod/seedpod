class RegistrationsController < Devise::RegistrationsController
 
  before_filter :configure_permitted_parameters
 
  protected
 
  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address_street, :address_locality, :address_region, :address_postcode,
        :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :address_street, :address_locality, :address_region, :address_postcode,
        :email, :password, :password_confirmation, :current_password)
    end
  end
 
 
  def after_sign_up_path_for(resource)
    new_user_subscription_path(resource)
  end
  
end