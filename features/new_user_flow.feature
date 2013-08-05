Feature: New user flow
  In order get started quickly
  As a potential user
  I want to be able to get the basic information quickly

Scenario: I can click a button on the homepage to sign up
  When I visit the homepage
  And I click the "Get Growing" link
  Then I should see the "Sign up" page

Scenario: Viewing a pod should invite me to sign up
  When I visit the homepage
  And I click "This Month"  
  Then I should see the "Sign up" page

Scenario: Signing up
  When I visit the sign up page
  And I click the "Sign up" button
  Then I should be warned that I need to fill in all the fields
