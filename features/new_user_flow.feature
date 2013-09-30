Feature: New user flow
  In order get started quickly
  As a potential user
  I want to be able to get the basic information quickly

Scenario: I can click a button on the homepage to sign up
  When I visit the homepage
  And I click the "Get Growing" link
  And I click the "S U B S C R I B E" link
  Then I should see the "Account Details" page

Scenario: Viewing a pod should show me the preview page
  When I visit the homepage
  And I click the "How it Works" link
  Then I should see the "How it Works" page

Scenario: Signing up
  When I visit the sign up page
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be warned that I need to fill in all the fields

@mechanize @vcr @hostname
Scenario: Signing up
  When I visit the sign up page
  And I fill in my details
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
