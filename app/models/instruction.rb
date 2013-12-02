class Instruction < ActiveRecord::Base
  belongs_to :crop
  belongs_to :pod
  
  rails_admin do
    configure :detail do
      html_attributes rows: 20, cols: 80
    end
  end
  
  def visible_to?(user)
    (ship == true || crop.shipped_to?(user)) && organic_match?(user)
  end
  
  def organic_match?(user)
    s = Shipment.where(user: user, pod: pod).first
    if s
      return true if s.organic? && (crop.organic == true)
      return true if !s.organic? && (crop.non_organic == true)
    end
    false
  end
  
end
