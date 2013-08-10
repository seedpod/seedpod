# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    gocardless_id "ABC123"
    cancelled_at  nil
    user          nil
  end
end
