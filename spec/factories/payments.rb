# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    gocardless_id "MyString"
    subscription nil
    amount 1.5
    paid_at "2013-08-10 10:49:46"
    success false
  end
end
