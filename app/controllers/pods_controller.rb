class PodsController < ApplicationController

  before_filter :require_login!, :only => [:show, :getting_started]
  before_filter :get_pod, :except => [:index, :getting_started]
  
  def index
    @body_class = 'homepage'
  end

  def show
    # Admins can see everything
    unless admin_signed_in?
      invisible = false
      # Pods in the future, or unpublished, are invisible
      if @pod.month > Date.today || @pod.published == false
        invisible ||= true
      end
      # Pods are invisible if they've not been paid for
      unless current_user.paid_for?(@pod)
        invisible ||= true
      end
      # If the pod should be invisible, redirect back to homepage
      if invisible
        redirect_to root_path
      end
    end
  end

  def getting_started
  end

  private

  def get_pod
    case params[:id]
    when 'this-month'
      if current_user && current_user.recently_signed_up?
        redirect_to page_path("preview")
      end
      @pod = Pod.where(month: Date.today.beginning_of_month).first
    when 'preview'
      @pod = Pod.where(month: (Date.today - 3.months).beginning_of_month).first
    else
      @pod = Pod.find_by_date(params[:id])
    end
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end

end
