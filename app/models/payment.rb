class Payment < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :pod

  validates :gocardless_id, presence: true, uniqueness: true
  validates :state, inclusion: %w{pending paid failed refunded retrying}

  def paid!(amount, time)
    update_attributes!(amount: amount, transacted_at: time, state: "paid")
    allocate_to_pod!
  end

  def failed!(time)
    update_attributes!(transacted_at: time, state: "failed")
  end

  def chargeback!
    update_attributes!(state: "refunded")
  end

  def pending!
    update_attributes!(state: "pending")
  end

  def retried!
    update_attributes!(state: "retrying")
  end

  def allocate_to_pod!
    # If there is no pod set for this payment, allocate it to the next one
    if pod.nil?
      update_attributes!(pod: Pod.next_to_ship)
    end
  end

end