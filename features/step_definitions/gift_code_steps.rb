When(/^I visit the gift code purchase page$/) do
  visit new_gift_code_path
end

When(/^I select a gifting option$/) do
  select '6 Months - £34.20', from: 'gift_code[months]'
end