class PodsController < ApplicationController

  before_filter :require_login!, :only => [:show, :getting_started]
  before_filter :check_subscription, :only => [:show, :getting_started, :this_month]
  before_filter :get_pod, :except => [:index, :getting_started, :this_month]
  
  def index
    @body_class = 'homepage'
  end

  def show
    # Admins can see everything
    unless admin_signed_in?
      # Show only shipped and published pods
      unless @pod.published == true && current_user.shipped?(@pod)
        redirect_to root_path
      end
    end
  end

  def getting_started
  end

  def this_month
    if user_signed_in?
      if current_user.recently_signed_up? || current_user.last_shipped_pod.nil?
        redirect_to getting_started_pods_path
      else
        redirect_to pod_path(current_user.last_shipped_pod)
      end
    elsif admin_signed_in?
      redirect_to pod_path(Pod.currently_shipping)
    else
      redirect_to pods_path
    end
  end
    
  private

  def get_pod
    @pod = Pod.find_by_date(params[:id])
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end

  def check_subscription
    if user_signed_in? && !current_user.subscribed?
      redirect_to page_path("preview")
    end
  end

end
