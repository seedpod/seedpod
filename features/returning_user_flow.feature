Feature: Returning user flow
  In order get the information I've paid for
  As a returning user
  I want to be able to see the latest information

Scenario: I can click a link on the homepage to sign in
  When I visit the homepage
  And I click "My Account"
  Then I should see the "Sign in" page


