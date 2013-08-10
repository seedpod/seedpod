class Payment < ActiveRecord::Base
  belongs_to :subscription

  validates :gocardless_id, presence: true, uniqueness: true
  validates :state, inclusion: %w{pending paid failed refunded retrying}

  def paid!(amount, time)
    update_attributes!(amount: amount, transacted_at: time, state: "paid")
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

end