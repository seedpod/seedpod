class Payment < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :pod

  validates :gocardless_id, presence: true, uniqueness: true
  validates :state, inclusion: %w{pending paid failed refunded retrying}

  def paid!(amount, time)
    update_attributes!(amount: amount, transacted_at: time, state: "paid")
    # Set pod to the current one if not set already
    update_attributes!(pod: Pod.currently_shipping) if pod.nil?
    # Create shipment record
    unless subscription.user.shipment_for(pod)
      Shipment.create(user: subscription.user, pod: pod)
    end
  end

  def failed!(time)
    update_attributes!(transacted_at: time, state: "failed")
  end

  def chargeback!
    update_attributes!(state: "refunded")
  end

  def pending!
    update_attributes!(state: "pending")
    # Set pod if not set already
    update_attributes!(pod: Pod.accepting_payments) if pod.nil?
  end

  def retried!
    update_attributes!(state: "retrying")
  end

end