Given(/^there is a pod for "(.*?)"$/) do |date|
  date = Date.parse(date).beginning_of_month
  @pod = Pod.where(month: date).first || FactoryGirl.create(:pod, month: date)
end

Given(/^there is a pod for the current month$/) do
  date = Date.today.beginning_of_month
  @current_pod = Pod.where(month: date).first || FactoryGirl.create(:pod, month: date)
end

Given(/^there is a pod for next month$/) do
  date = (Date.today + 1.month).beginning_of_month
  @next_pod = Pod.where(month: date).first || FactoryGirl.create(:pod, month: date)
end

Given(/^there is a pod for last month$/) do
  date = (Date.today - 1.month).beginning_of_month
  @previous_pod = Pod.where(month: date).first || FactoryGirl.create(:pod, month: date)
end

When(/^I visit the current pod$/) do
  visit '/pods/this_month'
end

Then(/^I should see content for the current pod$/) do
  page.should have_selector('h1', text: Date.today.strftime("%B %Y"))
end

When(/^I visit the next pod$/) do
  visit "/pods/#{(Date.today+1.month).strftime('%Y-%m')}"
end

Then(/^I should see content for the next pod$/) do
  page.should have_selector('h1', text: (Date.today+1.month).strftime("%B %Y"))
end

When(/^I visit the previous pod$/) do
  visit "/pods/#{(Date.today-1.month).strftime('%Y-%m')}"
end

Then(/^I should see content for the previous pod$/) do
  page.should have_selector('h1', text: (Date.today-1.month).strftime("%B %Y"))
end

Then(/^I should be redirected to the homepage$/) do
  steps %{
    Then I should see the signed-in homepage
  }
end

Then(/^I should be redirected to the sign in page$/) do
  steps %{
    Then I should see the get growing page
  }
end

Then(/^this month's pod should be paid for$/) do
  @user.paid_for?(@current_pod).should be_true
end

Then(/^I should see the getting started page$/) do
  page.should have_selector('h1', text: 'Get ready...')
end

Then(/^I should see the get growing page$/) do
  page.should have_selector('h1', text: 'Get Growing')
end

Then(/^I should see the preview page$/) do
  page.should have_selector('h1', text: 'On its way...')
end