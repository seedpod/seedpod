class Pod < ActiveRecord::Base
  has_many :instructions
  has_many :shipments

  validates :month, uniqueness: true

  rails_admin do
    object_label_method :to_param
  end

  
  def shipping_crops(organic = false, size = "medium")
    crops = instructions.where(ship: true).map{|x| x.crop}
    if organic
      crops = crops.select{|x| x.organic == true}
    else
      crops = crops.select{|x| x.non_organic == true}
    end
    case size
    when "small"
      crops = crops.select{|x| x.small == true}
    when "large"
      crops = crops.select{|x| x.large == true}
    else
      crops = crops.select{|x| x.medium == true}
    end
  end

  def self.find_by_date(date)
    Pod.where(month: Date.strptime(date, "%Y-%m")).first
  end

  def previous_pod(user)
    if !previous_pod = Pod.where(month: month << 1).first
      return false
    end

    if user && !previous_pod.shipped_to?(user)
      return false
    end

    previous_pod
  end

  def next_pod(user)
    if !next_pod = Pod.where(month: month >> 1).first
      return false
    end

    if user && !next_pod.shipped_to?(user)
      return false
    end

    next_pod
  end

  def to_param
    month.strftime("%Y-%m")
  end

  def self.accepting_payments
    Pod.where(month: (Date.today + 10.days).beginning_of_month).first
  end

  def self.currently_shipping
    if !(pod = Pod.where(month: Date.today.beginning_of_month).first)
      Pod.generate_future_pods!
      Pod.currently_shipping
    end
    pod
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

  
  def self.base_price_per_month(organic: false, size: "medium")
    base = 0
    if organic
      base = Pod.base_price_per_month + 1.00
    else
      base = 5.95
    end
    case size
    when "small"
      base -= 1.00
    when "large"
      base += 1.50
    end
    base
  end

  
  def self.price(months: 1, organic: false, size: "medium")
    (Pod.base_price_per_month(organic: organic, size: size) * months * (1.0-Pod.discount(months: months))).round(2)
  end

  def self.generate_future_pods!
    (0...12).each do |month|
      Pod.create(month: (Date.today + month.months).beginning_of_month)
    end
  end

end
