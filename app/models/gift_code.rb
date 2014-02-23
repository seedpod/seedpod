class GiftCode < ActiveRecord::Base
  has_one :subscription

  validates :code, uniqueness: true, presence: true
  validates :months, presence: true
  validates :purchaser_name, presence: true
  validates :purchaser_email, presence: true, format:  /@/
  validates :recipient_name, presence: true, if: :send_to_recipient
  validates :recipient_email, presence: true, format:  /@/, if: :send_to_recipient
  validates :send_date, presence: true, if: :send_to_recipient

  before_validation :generate_code

  def to_param
    code
  end
  
  def generate_code
    if self.code.nil?
    	loop do
    	  self.code = SecureRandom.hex(4)
        break if GiftCode.where(code: self.code).empty?
      end
  	end
  end
  
  def price
    Pod.price(months: months, organic: organic, size: size)
  end
  
  def mark_as_paid!
    update_attributes!(paid: true)
    if send_to_recipient
      Notifications.gift_code_receipt_with_recipient(self).deliver
      deliver! if send_date <= Date.today
    else
      Notifications.gift_code_receipt_without_recipient(self).deliver
    end
  end

  def paid?
    paid
  end

  def self.deliver_emails!
    GiftCode.where(sent: false, paid: true).where("send_date <= ?", Date.today).each do |code|
      code.deliver!
    end
  end

  def deliver!
    Notifications.gift_code(self).deliver
    update_attributes!(sent: true)    
  end

  def used_this_month?
    subscription.user.shipment_for(Pod.currently_shipping).present?
  end

  def use!
    if subscription && subscription.payments.count < months
      payment = subscription.payments.create
      payment.paid!(0, DateTime.now)
    end
  end

  def self.generate_shipments!
    Subscription.where("gift_code_id IS NOT NULL").each do |sub|
      sub.gift_code.use! unless sub.gift_code.used_this_month?
    end
  end

end
