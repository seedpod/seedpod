class PodsController < ApplicationController

  before_filter :require_login!, :only => [:show]

  def index
  end

  def show
    case params[:id]
    when 'this-month'
      @pod = Pod.where(month: Date.today.beginning_of_month, published: true).first
    when 'preview'
      @pod = Pod.where(month: (Date.today - 3.months).beginning_of_month, published: true).first
    else
      @pod = Pod.find_by_date(params[:id])
      if @pod.month > Date.today || @pod.published == false
        redirect_to '/pods/this-month' unless admin_signed_in?
      end
    end
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end

end
