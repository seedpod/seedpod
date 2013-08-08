When(/^I visit the homepage$/) do
  visit root_path
end

When(/^I visit the sign up page$/) do
  visit new_user_registration_path
end

When(/^I click the "(.*?)" link$/) do |label|
  click_link(label)
end

When(/^I click the "(.*?)" button$/) do |label|
  click_button(label)
end

Then(/^I should see the "(.*?)" page$/) do |title|
  page.should have_selector('h2', text: title)
end

Then(/^I should be warned that I need to fill in all the fields$/) do
  page.should have_content("7 errors")
end