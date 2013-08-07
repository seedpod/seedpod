Feature: Pod visibility
  In order to get the information I have paid for
  As a signed-up user
  I want to be able to see the right things

Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And there is a pod for last month
  And I am signed in

Scenario: Users can see the current pod
  When I visit the current pod
  Then I should see content for the current pod

Scenario: Users cannot see next month's pod
  When I visit the next pod
  Then I should be redirected to the current pod

Scenario: Users can see past pods
  When I visit the previous pod
  Then I should see content for the previous pod