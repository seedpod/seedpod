class Pod < ActiveRecord::Base
  has_many :instructions
  has_many :shipments
  
  rails_admin do
    object_label_method :to_param
  end
  
  def self.find_by_date(date)
    Pod.where(month: Date.strptime(date, "%Y-%m")).first
  end
  
  def to_param
    month.strftime("%Y-%m")
  end
  
  def self.next_to_ship
    Pod.where(month: (Date.today + 1.month).beginning_of_month).first
  end
  
end
