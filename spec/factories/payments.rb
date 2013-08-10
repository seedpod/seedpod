# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    gocardless_id "XYZ987"
    subscription  nil
    amount        6.0
    transacted_at "2013-08-10 12:00:00"
    state         "paid"
  end
end
