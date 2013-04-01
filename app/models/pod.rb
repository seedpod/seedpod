class Pod < ActiveRecord::Base
  has_many :instructions
  has_many :shipments
  
  def self.find_by_date(date)
    Pod.where(month: Date.strptime(date, "%Y-%m")).first
  end
  
  def generate_shipments!
    User.all.each do |user|
      if user.paid_for?(self) && Shipment.where(user: user, pod: self).empty?
        Shipment.create(user: user, pod: self)
      end
    end
  end
  
end
