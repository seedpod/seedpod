class Pod < ActiveRecord::Base
  has_many :instructions
  has_many :shipments
  
  rails_admin do
    object_label_method :to_param
  end
  
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
  
  def to_param
    month.strftime("%Y-%m")
  end
  
  def self.next_to_ship
    Pod.where(month: (Date.today + 1.month + 7.days).beginning_of_month).first
  end
  
end
