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

When(/^I select to receive the code myself$/) do
  select 'I would like to receive the gift code, and give the gift myself'
end

When(/^I select to send the code directly to the recipient$/) do
  select 'I would like the gift code to be emailed directly to the recipent'
end