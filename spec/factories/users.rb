# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.safe_email }
    password              "password"
    password_confirmation "password"
    name                  { Faker::Name.name }
    address_street        { Faker::Address.street_address }
    address_locality      { Faker::Address.city }
    address_region        { Faker::Address.state }
    address_postcode      { Faker::Address.postcode }
  end
end
