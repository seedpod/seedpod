class RegistrationsController < Devise::RegistrationsController
 
  protected
  
  def after_sign_up_path_for(user)
    new_user_subscription_path(user, gift_code: (params[:user][:gift_code].blank? ? nil : params[:user][:gift_code]))
  end
  
end