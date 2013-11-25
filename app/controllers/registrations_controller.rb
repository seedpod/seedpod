class RegistrationsController < Devise::RegistrationsController
 
  protected
  
  def after_sign_up_path_for(user)
    if user.subscribed?
      getting_started_pods_path      
    else
      new_user_subscription_path(user)
    end
  end
  
end