Feature: Subscription management
  In order to get my seedpod and control my expenditure
  As a signed up user
  I want to be able to manage my subscription

Background:
  Given I am signed in

Scenario: Gocardless tells us when subscriptions have been set up
  When GoCardless sends a subscription confirmation
  Then my subscription details should be stored
  #And I should be able to see my subscription ID on my account page
  
Scenario: Gocardless tells us a subscription is cancelled
  Given I have a subscription set up
  When GoCardless sends a subscription cancellation
  Then my subscription should be marked as cancelled
  
Scenario: Gocardless tells us a subscription has expired
  Given I have a subscription set up
  When GoCardless sends a subscription expiry notification
  Then my subscription should be marked as cancelled
  
Scenario: Subscriptions are cancelled when a user deletes their account
  Given I have a subscription set up
  Then my subscription should be cancelled
  When I delete my account

Scenario: I am warned if I don't have a subscription set up
  Given I do not have a subscription set up
  When I visit the homepage
  Then I should see a subscription warning

Scenario: I am not warned if I do have a subscription set up
  When I have a subscription set up
  And I visit the homepage
  Then I should not see a subscription warning