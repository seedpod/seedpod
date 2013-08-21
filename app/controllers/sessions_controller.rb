class SessionsController < Devise::SessionsController
  
  def create
    case params[:sign_in_action]
    when 'sign_up'
      redirect_to new_user_registration_path(:'email' => params[:user][:email])
    else
      super
    end
  end
  
end