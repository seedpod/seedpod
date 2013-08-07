Given(/^an admin user exists$/) do
  @admin = FactoryGirl.create :admin
end

Given(/^I am signed in as an administrator$/) do
  steps %{
    Given an admin user exists
    And I visit the admin sign in page
    And I fill in my admin login details
    And I click the "Sign in" button
  }
end

Given(/^I visit the admin sign in page$/) do
  visit new_admin_session_path
end

When(/^I fill in my admin login details$/) do
  fill_in "admin_email"    , with: @admin.email
  fill_in "admin_password" , with: "password"
end
