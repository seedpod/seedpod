# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gift_code do
    code "deadbeef"
    claimed_at nil
    months 12
    user nil
  end
end
