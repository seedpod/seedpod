Feature: Subscription management
  In order to get my seedpod and control my expenditure
  As a signed up user
  I want to be able to manage my subscription

Scenario: I can click a button on the homepage to sign up
  Given I am signed in
  When GoCardless sends a subscription confirmation
  Then my subscription details should be stored
  #And I should be able to see my subscription ID on my account page
  
Scenario: Gocardless tells us a subscription is cancelled
  Given I am signed in
  And I have a subscription set up
  When GoCardless sends a subscription cancellation
  Then my subscription should be marked as cancelled
  
Scenario: Gocardless tells us a subscription has expired
  Given I am signed in
  And I have a subscription set up
  When GoCardless sends a subscription expiry notification
  Then my subscription should be marked as cancelled

Scenario: Gocardless tells us a payment has been created
  Given I am signed in
  And I have a subscription set up
  When GoCardless sends a bill created notification
  Then my payment should be recorded as pending

Scenario: Gocardless tells us a bill has been paid
  Given I am signed in
  And I have a subscription set up
  When GoCardless sends a bill paid notification
  Then my payment should be recorded
  
Scenario: Gocardless tells us a payment has failed
  Given I am signed in
  And I have a subscription set up
  When GoCardless sends a bill failed notification
  Then my payment should be recorded as failed

Scenario: Gocardless tells us a payment has been charged back
  Given I am signed in
  And I have a subscription set up
  And I have made a payment
  When GoCardless sends a bill chargeback notification
  Then the payment should be marked as refunded

Scenario: Gocardless tells us a payment has been retried
  Given I am signed in
  And I have a subscription set up
  And I have made a payment
  When GoCardless sends a bill retried notification
  Then my payment should be recorded as retrying

