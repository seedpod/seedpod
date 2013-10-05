class Crop < ActiveRecord::Base
  has_many :instructions
  
  def shipped_to?(user)
    shipping_pod.shipped_to?(user)
  end
  
  def shipping_pod
    instructions.where(ship: true).first.pod
  end
  
end
