When(/^I visit the homepage$/) do
  visit root_path
end

When(/^I click the "(.*?)" link$/) do |label|
  click_link(label)
end

Then(/^I should see the "(.*?)" page$/) do |title|
  page.should have_selector('h2', text: title)
end