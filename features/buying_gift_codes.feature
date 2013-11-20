Feature: Buying gift codes
  In order to be able to give seedpod as a gift
  As a member of the public
  I want to be able to buy a gift code

@mechanize @vcr @hostname
Scenario: Buy a gift code and get it myself
  When I visit the gift code purchase page
  And I select a gifting option
  And I enter my details as the purchaser
  And I select to receive the code myself
  And I click the "Pay with PayPal" button
  Then the gift code object should be created correctly in the database
  And I should be sent to PayPal to pay

@mechanize @vcr @hostname
Scenario: Buy a gift code and send directly
  When I visit the gift code purchase page
  And I select a gifting option
  And I enter my details as the purchaser
  And I select to send the code directly to the recipient
  And I enter their details as the recipient
  And I click the "Pay with PayPal" button
  Then the gift code object should be created correctly in the database
  And I should be sent to PayPal to pay

Scenario: Use button from homepage to buy gift
  When I visit the homepage
  And I click the "G I F T" link
  Then I should see the "Gift Subscriptions" page
  
Scenario: When I buy a gift code I get redirected to the gift code page
  Given I have paid for a gift subscription on gocardless
  Then I should be redirected to the gift code page
  
Scenario: When I have selected to get the gift code myself I should see the gift code  
  Given I have been redirected to the gift code page
  And I have selected to receive the code myself
  Then I should see a gift code
  And I should recieve an email with the gift code
  
Scenario: When I have selected the recipient to get the gift code I cannot see it  
  Given I have been redirected to the gift code page
  And I have selected the recipient to receive the gift code
  And I have entered the date for the code to be sent 
  Then I should see no gift code
  And I should recieve an email reciept
  And the recipient should recieve the gift code
