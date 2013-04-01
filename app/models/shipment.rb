class Shipment < ActiveRecord::Base
  belongs_to :pod
  belongs_to :user
end
