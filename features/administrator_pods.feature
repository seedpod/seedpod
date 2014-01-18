Feature: Pod visibility to admins
  In order to plan future pods
  As an administrator
  I want to be able to see everything

Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And there is a pod for last month
  And I am signed in as an administrator

Scenario: Admins can see the current pod
  When I visit the current pod
  Then I should see content for the current pod

Scenario: Admins cannot see next month's pod
  When I visit the next pod
  Then I should see content for the next pod

Scenario: Admins can see past pods
  When I visit the previous pod
  Then I should see content for the previous pod
