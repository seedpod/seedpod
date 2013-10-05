Feature: Show users their instructions
  In order to see what I should do each month
  As a subscribed user
  I want to be able to view the instructions for each pod
  
Background:
  Given there is a crop called "Carrots"
  And there is a crop called "Turnips"
  And there is a pod for the current month
  And the current pod has instructions and shipping for "Carrots"
  And the current pod has instructions for "Turnips"
  And there is a pod for last month
  And the previous pod has instructions and shipping for "Turnips"
  And I am signed in
  And I have a subscription set up
  
Scenario: Show instructions for past crops that were shipped to me
  Given I have paid for the previous pod
  And the previous pod was shipped to me
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see instructions for "Carrots"
  And I should see instructions for "Turnips"

Scenario: Don't show instructions for past crops that were not shipped to me
  Given the previous pod was not shipped to me
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see instructions for "Carrots"
  And I should not see instructions for "Turnips"