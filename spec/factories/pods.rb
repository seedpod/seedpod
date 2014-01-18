# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :pod do
    month Date.today.beginning_of_month
    published true
  end

end
