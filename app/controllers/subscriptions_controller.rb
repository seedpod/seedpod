class SubscriptionsController < ApplicationController

  before_filter :get_user

  def new
    url = GoCardless.new_subscription_url(
      :interval_unit   => "month",
      :interval_length => 1,
      :amount          => "5.00",
      :name            => t(:seedpod),
      :description     => t(:tagline),
      :state           => params[:user_id],
      :redirect_uri    => confirm_user_subscription_url(@user),
      :user            => {
        :email         => @user.email, 
      }
    )
    redirect_to url
  end

  def confirm    
    if params[:state].to_i == @user.id
      # Confirm with gocardless
      GoCardless.confirm_resource(params)
      # Store subscription ID
      @user.update_attributes!(subscription_id: params[:resource_id])
      # Send back to main page
      redirect_to root_path
    else
      raise "Wrong user!"
    end
  rescue GoCardless::ApiError => ex
    raise
  end
  
  private
  
  def get_user
    @user = User.find(params[:user_id])
    redirect_to root_path if @user != current_user
  end
  
end
