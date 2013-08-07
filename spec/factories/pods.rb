# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :pod do
    month Date.today.beginning_of_month
    published true
  end

  factory :next_pod, class: Pod do
    month (Date.today + 1.month).beginning_of_month
    published true
  end

  factory :previous_pod, class: Pod do
    month (Date.today-1.month).beginning_of_month
    published true
  end

end
