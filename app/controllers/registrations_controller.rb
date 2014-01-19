class RegistrationsController < Devise::RegistrationsController
 
  protected
  
  def after_sign_up_path_for(user)
    new_user_subscription_path(user, 
      gift_code: (params[:user][:gift_code].blank? ? nil : params[:user][:gift_code]),
      organic: (params[:user][:organic].blank? ? nil : params[:user][:organic]),
      size: (params[:user][:size].blank? ? nil : params[:user][:size])
    )
  end
  
end