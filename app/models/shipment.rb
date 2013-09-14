class Shipment < ActiveRecord::Base
  belongs_to :pod
  belongs_to :user

  after_save :send_shipment_email

  def crops
    pod.instructions.map{|x| x.ship ? x.crop : nil}.compact
  end
  
  def ship!
    update_attributes!(shipped: true)
  end

  def send_shipment_email
    if shipped_changed? && shipped_was == false && shipped == true
      # Tell the user!
      Notifications.shipped(self.user).deliver      
    end
  end

  
end
