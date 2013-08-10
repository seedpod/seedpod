Feature: Subscription management
  In order to get my seedpod and control my expenditure
  As a signed up user
  I want to be able to manage my subscription

Scenario: I can click a button on the homepage to sign up
  Given I am signed in
  When GoCardless sends a subscription confirmation
  Then my subscription details should be stored
  #And I should be able to see my subscription ID on my account page