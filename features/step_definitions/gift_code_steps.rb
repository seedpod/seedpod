When(/^I visit the gift code purchase page$/) do
  visit new_gift_code_path
end

When(/^I select a gifting option$/) do
  select '6 Months - £34.20', from: 'gift_code[months]'
end

When(/^I enter my details as the purchaser$/) do
  @purchaser_email = Faker::Internet.email
  @purchaser_name = Faker::Name.name
  fill_in 'gift_code[purchaser_name]', with: @purchaser_name
  fill_in 'gift_code[purchaser_email]', with: @purchaser_email
end