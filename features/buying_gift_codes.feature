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
  Given I have created a gift code
  And I have paid for the gift code with PayPal
  Then I should see the "Purchase Complete" page
  And the gift code should be marked as paid
  
Scenario: When Paypal response is invalid I get shown the gift code purchase page with an error
  Given I have created a gift code
  And I the PayPal response was invalid
  Then I should see the "Gift Subscriptions" page
  And the gift code should not be marked as paid
  And I should see an error from PayPal
  
Scenario: When my payment is cancelled, I get sent to the homepage
  Given I have created a gift code
  And I have cancelled the PayPal purchase
  Then I should see the homepage
  And the gift code should not be marked as paid
  
Scenario: When I have selected to get the gift code myself I should see the gift code  
  Given I have created a gift code
  And I have selected to receive the code myself
  And I have paid for the gift code with PayPal
  Then I should see the "Purchase Complete" page
  And I should see a gift code
  And I should recieve an email with the gift code
  
Scenario: When I have selected the recipient to get the gift code I cannot see it  
  Given I have created a gift code
  And I have selected the recipient to receive the gift code at a future date
  And I have paid for the gift code with PayPal
  Then I should see the "Purchase Complete" page
  But I should not see a gift code
  And I should recieve an email reciept