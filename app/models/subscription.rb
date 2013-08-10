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
  
  def update_payment(payment_id, state, amount, transacted_at)
    # Get payment
    payment = payments.find_or_create_by(gocardless_id: payment_id)
    # Check status and mark payment appropriately
    case state
    when 'created'
      payment.pending!
    when 'paid'
      payment.paid! amount, transacted_at
    when 'failed'
      payment.failed! transacted_at
    when 'chargeback'
      payment.chargeback!
    when 'retried'
      payment.retried!
    end
  end

end
