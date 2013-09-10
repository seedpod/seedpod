Feature: Payment management
  In order to be able to tell who has access to what
  As a seedpod administrator
  I want to be able to track payments on people's subscription

Background:
  Given I am signed in
  And I have a subscription set up
  And there is a pod for the current month
  And there is a pod for next month

Scenario: Gocardless tells us the first payment has been created
  Given I have not yet paid for any pods
  When GoCardless sends a bill created notification
  Then my payment should be recorded as pending
  And I should receive a welcome email

Scenario: Gocardless tells us a subsequent payment has been created
  Given I have paid for the current pod
  When GoCardless sends a bill created notification
  Then my payment should be recorded as pending
  And I should not receive a welcome email

Scenario: Gocardless tells us a bill has been paid
  When GoCardless sends a bill paid notification
  Then my payment should be recorded
  And this month's pod should be paid for
  
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

