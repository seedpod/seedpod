# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift_code do
    code "deadbeef"
    claimed_at nil
    months 12
    organic false
    subscription nil
    purchaser_name { Faker::Name.name }
    purchaser_email { Faker::Internet.email }
    send_to_recipient false
    recipient_name { Faker::Name.name }
    recipient_email { Faker::Internet.email }
    send_date { 1.week.from_now.to_date }
  end
end
