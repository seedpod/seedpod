Feature: Gift codes
  In order to be able to give seedpod as a gift
  As a member of the public
  I want to be able to buy or claim a gift code
  
Scenario: Buy a gift code
  When I visit the gift code purchase page
  And I select a gifting option
  And I fill in my email address
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to pay

Scenario: Use button from homepage to buy gift
  When I visit the home page
  And I click the gift button
  Then I should be redirected to the buy a gift page  
  
Scenario: When I buy a gift code I get redirected to the gift code page
  Given I have payed for a gift subscription on gocardless
  Then I should be redirected to the gift code page
  
Scenario: When I have selected to get the gift code myself I should see the gift code  
  Given I have been redirected to the gift code page
  And I have selected to recieve the code myself
  Then I should see a gift code
  And I should recieve an email with the gift code
  
Scenario: When I have selected the recipient to get the gift code I cannot see it  
  Given I have been redirected to the gift code page
  And I have selected the recipient to receive the gift code
  And I have entered the date for the code to be sent 
  Then I should see no gift code
  And I should recieve an email reciept
  And the recipient should recieve the gift code
  
Scenario: Use a gift code
  When I visit the sign up page
  And I enter all my details
  And I click pay with gift code
  Then I should be a member of the current pod immediately
  