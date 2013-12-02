Given(/^I have previously registered$/) do
  @user = FactoryGirl.create :user
end

Given(/^I am signed in$/) do
  steps %{
    Given I have previously registered 
    And I visit the sign in page
    And I fill in my login details
    And I click the "Log in" button
  }
end

Given(/^I am signed in as "(.*?)"$/) do |name|
  @user = FactoryGirl.create :user, name: name
  steps %{
    And I visit the sign in page
    And I fill in my login details
    And I click the "Log in" button
  }
end

Given(/^there is a user$/) do
  steps %{
    Given I have previously registered
    And I have a subscription set up
  }
end

When(/^I visit the sign up page$/) do
  visit new_user_registration_path
end

When(/^I visit the sign in page$/) do
  visit new_user_session_path
end

Then(/^I should be warned that I need to fill in all the fields$/) do
  page.should have_content("6 errors")
end

When(/^I fill in my login details$/) do
  fill_in "user_email"    , with: @user.email
  fill_in "user_password" , with: "password"
end

When(/^I fill in my details$/) do
  @user_name = "Brian Fish"
  @user_email = "brian@example.com"
  fill_in "user_email"                 , with: @user_email
  fill_in "user_password"              , with: "password"
  fill_in "user_password_confirmation" , with: "password"
  fill_in "user_name"                  , with: @user_name
  fill_in "user_address_street"        , with: "42 Wallaby Way"
  fill_in "user_address_locality"      , with: "Anytown"
  fill_in "user_address_postcode"      , with: "AA1 1AA"
end

When(/^I delete my account$/) do
  @user.destroy
end