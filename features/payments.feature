Feature: Payment management
  In order to be able to tell who has access to what
  As a seedpod administrator
  I want to be able to track payments on people's subscription

Background:
  Given I am signed in
  And I have a subscription set up

Scenario: Gocardless tells us a payment has been created
  When GoCardless sends a bill created notification
  Then my payment should be recorded as pending

Scenario: Gocardless tells us a bill has been paid
  When GoCardless sends a bill paid notification
  Then my payment should be recorded
  
Scenario: Gocardless tells us a payment has failed
  When GoCardless sends a bill failed notification
  Then my payment should be recorded as failed

Scenario: Gocardless tells us a payment has been charged back
  Given I have made a payment
  When GoCardless sends a bill chargeback notification
  Then the payment should be marked as refunded

Scenario: Gocardless tells us a payment has been retried
  Given I have made a payment which failed
  When GoCardless sends a bill retried notification
  Then my payment should be recorded as retrying

