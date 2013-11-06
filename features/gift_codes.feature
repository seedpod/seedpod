Feature: Gift codes
  In order to be able to give seedpod as a gift
  As a member of the public
  I want to be able to buy or claim a gift code
  
Scenario: Buy a gift code as a non-member
  Given I am not logged in
  When I visit the gift code purchase page
  And I hit purchase
