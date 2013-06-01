class PodsController < ApplicationController

  def index
  end

  def show
    case params[:id]
    when 'this-month'
      @pod = Pod.where(month: Date.today.beginning_of_month, published: true).first
    when 'preview'
      @pod = Pod.where(month: (Date.today - 3.months).beginning_of_month, published: true).first
    else
      raise ActiveRecord::RecordNotFound unless admin_signed_in?
      @pod = Pod.find_by_date(params[:id])
    end
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end

end
