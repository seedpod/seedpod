Feature: Shipping
  In order to deliver the pods
  As an administrator
  I want to be able to see and manage the shipping list

Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And there is a pod for last month
  And I am signed in as an administrator

@javascript
Scenario: Admins can see what needs to be shipped
  Given there is a user
  And that user has paid for the next pod
  When I visit the shipping list for the next pod
  Then I should see the user in the shipping list
  And I click the "Ship It" button
  Then the shipment should be marked as shipped
  And the user should get a shipped email