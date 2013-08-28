class SubscriptionsController < ApplicationController

  before_filter :get_user, :except => [:gocardless_webhook]

  def new
    url = GoCardless.new_subscription_url(
      :interval_unit   => "month",
      :interval_length => 1,
      :amount          => "6.00",
      :name            => t(:seedpod),
      :description     => t(:tagline),
      :state           => params[:user_id],
      :redirect_uri    => confirm_user_subscription_url(@user),
      :user            => {
        :email            => @user.email,
        :first_name       => @user.first_name,
        :last_name        => @user.last_name,
        :billing_address1 => @user.address_street,
        :billing_town     => @user.address_locality,
        :postal_code      => @user.address_postcode,
      }
    )
    redirect_to url
  end

  def confirm    
    if params[:state].to_i == @user.id
      # Confirm with gocardless
      GoCardless.confirm_resource(params)
      # Store subscription ID
      @user.subscriptions.create(gocardless_id: params[:resource_id])
      # Send back to main page
      redirect_to root_path
    else
      raise "Wrong user!"
    end
  rescue GoCardless::ApiError => ex
    raise
  end
  
  def gocardless_webhook
    payload = JSON.parse(params['payload'])
    # Check validity
    unless GoCardless.webhook_valid?(payload)
      render :text => "false", :status => 403
      return
    end
    # Is this a subscription, or a bill notification?
    case payload['resource_type']
    when "subscription"
      process_subscription_webhook(payload)        
    when "bill"
      process_bill_webhook(payload)        
    end
    # Done
    render :text => "true", :status => 200
  end
  
  private
  
  def process_subscription_webhook(payload)
    payload['subscriptions'].each do |subscription|
      case subscription['status']
      when 'cancelled', 'expired'
        Subscription.on_cancel!(subscription['id'])
      end
    end
  end
  
  def process_bill_webhook(payload)
    payload["bills"].each do |bill|
      # Check right resource type
      next if bill['source_type'] != 'subscription'
      # Find subscription object that this payment is for
      sub = Subscription.where(gocardless_id: bill['source_id']).first
      sub.update_payment(bill['id'], bill['status'], bill['amount'], DateTime.parse(bill['paid_at'])) if sub
    end      
  end

  def get_user
    @user = User.find(params[:user_id])
    redirect_to root_path if @user != current_user
  end
  
end
