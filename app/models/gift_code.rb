class GiftCode < ActiveRecord::Base
  belongs_to :user

  validates :code, uniqueness: true, presence: true
  validates :months, presence: true

  before_validation :generate_code

  def generate_code
    if self.code.nil?
    	loop do
    	  self.code = SecureRandom.hex(4)
        break if GiftCode.where(code: self.code).empty?
      end
  	end
  end

end
