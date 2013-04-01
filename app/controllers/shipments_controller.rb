class ShipmentsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :get_pod


  def index
    @shipments = @pod.shipments
  end

  def show
  end

  private
  
  def get_pod
    @pod = Pod.find_by_date(params[:pod_id])
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end
  
end
