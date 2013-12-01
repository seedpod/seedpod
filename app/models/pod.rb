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
  
  def self.price(months: 1, organic: false)
    base_price = 6 * months
    case months
    when 1..5
      base_price
    when 6..8
      (base_price * 0.95).round(2)
    when 9..11
      (base_price * 0.90).round(2)
    else
      (base_price * 0.85).round(2)
    end
  end
  
  def self.price_string(months: 1, organic: false)
    "%.2f" % price(months: months, organic: organic)
  end
  
end
