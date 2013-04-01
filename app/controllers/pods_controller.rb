class PodsController < ApplicationController

  def index
  end

  def show
    case params[:id]
    when 'this-month'
      @pod = Pod.where(month: Date.today.beginning_of_month).first
    when 'preview'
      @pod = Pod.where(month: (Date.today - 3.months).beginning_of_month).first
    else
      raise ActiveRecord::RecordNotFound unless admin_signed_in?
      @pod = Pod.where(month: Date.strptime(params[:id], "%Y-%m")).first
    end
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end

end
