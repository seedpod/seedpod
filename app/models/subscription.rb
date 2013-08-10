class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  
  validates :gocardless_id, presence: true, uniqueness: true
  
  def self.cancel!(gocardless_id)
    sub = Subscription.where(gocardless_id: gocardless_id).first
    sub.cancel! if sub
  end
  
  def cancel!
    update_attributes!(cancelled_at: DateTime.now)
  end

end
