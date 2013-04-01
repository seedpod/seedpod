class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shipments

  def paid_for?(pod)
    # Need some logic here around whether a user has paid for a particular pod
    # This will test the date of their last payment against the date of the pod,
    # most likely
    true
  end

end
