class GiftCode < ActiveRecord::Base
  belongs_to :user

  validates :code, uniqueness: true, presence: true
  validates :months, presence: true

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

  def purchaser_first_name
    purchaser_name ? purchaser_name.split(' ',2)[0] : ''
  end
  
  def purchaser_last_name
    purchaser_name ? purchaser_name.split(' ',2)[1] : ''
  end
  
  def price_string
    "£%.2f" % price
  end
  
  def price
    GiftCode.prices[months]
  end
  
  def description
    "#{months} month subscription"
  end
  
  def self.prices
    {
      3  => 18.00,
      6  => 34.20,
      9  => 48.60,
      12 => 61.20,
    }
  end

  def mark_as_paid!
    update_attributes!(paid: true)
    if send_to_recipient
      Notifications.gift_code_receipt_with_recipient(self).deliver      
    else
      Notifications.gift_code_receipt_without_recipient(self).deliver
    end
  end

  def paid?
    paid
  end

end
