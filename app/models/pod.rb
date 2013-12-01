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
  
  def self.accepting_payments
    Pod.where(month: (Date.today + 10.days).beginning_of_month).first
  end
  
  def self.currently_shipping
    Pod.where(month: Date.today.beginning_of_month).first
  end

  def shipped_to?(user)
    shipments.where(user: user).first.present?
  end
  
  def self.discount(months: 1)
    case months
    when 1..5
      0
    when 6..8
      0.05
    when 9..11
      0.10
    else
      0.15
    end
  end
  
  def self.base_price_per_month(organic: false)
    6.00
  end
  
  def self.price(months: 1, organic: false)
    (Pod.base_price_per_month(organic: organic) * months * (1.0-Pod.discount(months: months))).round(2)
  end
  
end
