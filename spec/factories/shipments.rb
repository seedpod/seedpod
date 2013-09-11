# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pending_shipment, class: Shipment do
    shipped false
  end
  factory :completed_shipment, class: Shipment do
    shipped true
  end
end
