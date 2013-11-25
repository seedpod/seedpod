Feature: Claiming gift codes
  In order to be able to receive seedpod as a gift
  As a gift code recipient
  I want to be able to apply the gift code to my account

@javascript
Scenario: Sign up with a gift code
  Given a gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then I should see the getting started page

@javascript
Scenario: Sign up with a made-up gift code
  When I visit the sign up page
  And I fill in my details
  And I enter a made-up gift code
  And I click the "Join SeedPod" button
  Then I should see the "Account Details" page
  And I should see an invalid gift code error

@javascript
Scenario: Sign up with an unpaid gift code
  Given a gift code has been bought for me
  But the gift code was not paid for
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then I should see the "Account Details" page
  And I should see an invalid gift code error
