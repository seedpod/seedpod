When(/^I visit the homepage$/) do
  visit root_path
end

Given(/^I fill in:$/) do |table|
  table.rows_hash.each_pair do |field, value|
    fill_in field, with: value
  end
end

When(/^I select "(.*?)"$/) do |selection|
  select selection
end

When(/^I click the "(.*?)" link$/) do |label|
  click_link(label)
end

When(/^I click the "(.*?)" button$/) do |label|
  click_button(label)
end

Then(/^I should see the "(.*?)" page$/) do |title|
  page.should have_selector('h1', text: title)
end

Then(/^I should see the signed\-in homepage$/) do
  page.should have_selector('.tagline')
  page.should have_selector('a', text: "Growing Guidance")
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_text(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_text(text)
end

Then(/^I should see the homepage$/) do
  page.should have_selector('.tagline')
  page.should have_selector('a', text: "How it Works")
end

Given(/^it is (\d+) days before the end of the month$/) do |num|
  Timecop.freeze(Date.today.end_of_month - num.to_i.days)
end

Given(/^the date is "(.*?)"$/) do |date|
  Timecop.freeze(Date.parse(date))
end