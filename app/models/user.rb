class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shipments
  
  has_many :subscriptions do
    def active
      where(cancelled_at: nil).first
    end
  end
  has_many :payments, through: :subscriptions

  before_destroy :cancel_subscription!

  validates :name            , :presence => true
  validates :address_street  , :presence => true
  validates :address_locality, :presence => true
  #validates :address_region  , :presence => true
  validates :address_postcode, :presence => true

  def paid_for?(pod)
    # Need some logic here around whether a user has paid for a particular pod
    # This will test the date of their last payment against the date of the pod,
    # most likely
    payments.where(pod: pod, state: "paid").present?
  end
  
  def recently_signed_up?
    subscriptions.active && subscriptions.active.awaiting_first_payment?
  end
  
  def address
    [:name, :address_street, :address_locality, :address_region, :address_postcode].compact.join(', ')
  end
   
  def cancel_subscription!
    subscription = GoCardless::Subscription.find(subscription_id)
    subscription.cancel!
    subscription_id = nil
    save!
  end
   
  # We store name as a single string and split for gocardless later on.
  # Firstname / lastname assumption is daft.
   
  def first_name
    name ? name.split(' ',2)[0] : ''
  end
  
  def last_name
    name ? name.split(' ',2)[1] : ''
  end
  
end
