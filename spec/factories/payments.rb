# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    gocardless_id { Faker::Number.number(10) }
    subscription  nil
    amount        6.0
    transacted_at "1970-01-01"
    state         "pending"
  end
end
