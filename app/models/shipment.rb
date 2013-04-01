class Shipment < ActiveRecord::Base
  belongs_to :pod
  belongs_to :user

  def crops
    pod.instructions.map{|x| x.ship ? x.crop : nil}.compact
  end
  
end
