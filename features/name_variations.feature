Feature: Name variants
  In order to be able to feel like a valued user
  As a person with an unusual name
  I want SeedPod to get my name right

@timecop
Scenario: Welcome emails encode apostrophes correctly
  Given I am signed in as "Bob O'Really"
  And I have a subscription set up
  And there is a pod for the current month
  And there is a pod for next month
  Given I have not yet paid for any pods
  And it is 11 days before the end of the month
  When GoCardless sends a bill created notification
  Then my payment should be recorded as pending
  And my payment should be marked for this month's pod
  And I should receive a welcome email
