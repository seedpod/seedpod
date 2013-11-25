class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shipments
  
  has_many :subscriptions, dependent: :destroy do
    def active
      where("(gift_code_id IS NOT NULL AND cancelled_at > ?) OR (cancelled_at IS NULL)", DateTime.now).first
    end
  end
  has_many :payments, through: :subscriptions

  validates :name            , :presence => true
  validates :address_street  , :presence => true
  validates :address_locality, :presence => true
  #validates :address_region  , :presence => true
  validates :address_postcode, :presence => true

  # fake accessor for gift codes on signup
  attr_accessor :gift_code

  rails_admin do
    edit do
      configure :confirmation_token do
        read_only true
      end
    end
  end

  def subscribed?
    subscriptions.active.present?
  end

  def paid_for?(pod)
    payments.where(pod: pod, state: "paid").present?
  end
  
  def shipment_for(pod)
    shipments.where(pod: pod).first
  end
  
  def shipped?(pod)
    shipments.where(pod: pod, shipped: true).first.present?
  end
  
  def last_shipped_pod
    shipments.where(shipped: true).order(:created_at).last.try(:pod)
  end
  
  def recently_signed_up?
    subscribed? && subscriptions.active.awaiting_first_payment?
  end
  
  def address
    [name, address_street, address_locality, address_postcode].compact.join(', ')
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
