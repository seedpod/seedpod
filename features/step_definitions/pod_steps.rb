Given(/^there is a pod for the current month$/) do
  FactoryGirl.create :pod
end

Given(/^there is a pod for next month$/) do
  FactoryGirl.create :next_pod
end

Given(/^there is a pod for last month$/) do
  FactoryGirl.create :previous_pod
end

When(/^I visit the current pod$/) do
  visit '/pods/this-month'
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

Then(/^I should be redirected to the current pod$/) do
  steps %{
    Then I should see content for the current pod
  }
end

Then(/^next month's pod should be paid for$/) do
  @user.paid_for?(Pod.last).should be_true
end