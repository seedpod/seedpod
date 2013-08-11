Feature: Pod visibility
  In order to get the information I have paid for
  As a signed-up user
  I want to be able to see the right things

Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And there is a pod for last month
  And I am signed in
  And I have a subscription set up

Scenario: New users see a getting started page
  When I visit the current pod
  Then I should see the getting started page

Scenario: Users who have paid for the current pod can see it
  Given I have paid for the current pod
  When I visit the current pod
  Then I should see content for the current pod

Scenario: Users cannot see past pods if they haven't paid for them
  When I visit the previous pod
  Then I should be redirected to the homepage
  
Scenario: Users can see past pods if they have paid for them
  Given I have paid for the previous pod
  When I visit the previous pod
  Then I should see content for the previous pod
  
Scenario: Users cannot see next month's pod
  When I visit the next pod
  Then I should be redirected to the homepage
