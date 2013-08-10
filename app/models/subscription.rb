class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :payments
  
  def self.cancel!(gocardless_id)
    sub = Subscription.where(gocardless_id: gocardless_id).first
    sub.cancel! if sub
  end
  
  def cancel!
    update_attributes!(cancelled_at: DateTime.now)
  end
  
  def add_payment(payment_id, amount, paid_at)
    payments.create(gocardless_id: payment_id, amount: amount, paid_at: paid_at, success: true)
  end
  
  def add_failed_payment(payment_id, paid_at)
    payments.create(gocardless_id: payment_id, paid_at: paid_at, success: false)
  end

  def chargeback_payment(payment_id)
    payment = payments.where(gocardless_id: payment_id).first
    if payment
      payment.update_attributes!(success: false)
    end
  end
  
end
