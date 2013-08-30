Feature: Password resets
  In order get back into my account
  As a silly person who has forgotten my password
  I want to be able to reset my password and get a new one

Background:
  Given I have previously registered

Scenario: I can reset my password
  Given I have requested a password reset
  When I visit the password reset page
  And I enter a new password
  Then my password should be changed