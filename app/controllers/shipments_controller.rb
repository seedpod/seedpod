class ShipmentsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :get_pod


  def index
    # Update all the shipments
    @pod.generate_shipments!
    # Now load them and display
    @shipments = @pod.shipments
    unless params[:all].present?
      @shipments = @shipments.where(:shipped => false)
    end
  end

  def update
    @shipment = @pod.shipments.find(params[:id])
    @shipment.ship!
  end

  private
  
  def get_pod
    @pod = Pod.find_by_date(params[:pod_id])
    raise ActiveRecord::RecordNotFound if @pod.nil?
  end
  
end
