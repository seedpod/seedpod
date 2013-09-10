class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :payments, dependent: :destroy
  
  validates :gocardless_id, presence: true, uniqueness: true
  
  before_destroy :cancel!

  def self.on_cancel!(gocardless_id)
    sub = Subscription.where(gocardless_id: gocardless_id).first
    sub.on_cancel! if sub
  end
  
  def on_cancel!
    update_attributes!(cancelled_at: DateTime.now)
  end

  def cancel!
    gocardless_subscription.cancel!
    # The webhook will call us back, resulting in on_cancel! being called later
  end

  def update_payment(payment_id, state, amount, transacted_at)
    # Get payment
    payment = payments.find_or_create_by(gocardless_id: payment_id)
    # Check status and mark payment appropriately
    case state
    when 'created'
      payment.pending!
      payment.update_attributes!(pod: Pod.currently_shipping)
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

  def awaiting_first_payment?
    payments.empty? || (payments.size == 1 && payments.first.state == "pending")
  end

  private
  
  def gocardless_subscription
    GoCardless::Subscription.find(gocardless_id)
  end
  
end
