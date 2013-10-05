# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :instruction do
    ship false
    summary 'Summary.'
    detail 'Lorem ipsum dolor sit amet.'
  end

end
