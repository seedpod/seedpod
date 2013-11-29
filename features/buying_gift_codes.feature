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
  And I click the "pay-with-paypal" button
  Then the gift code object should be created correctly in the database
  And I should be sent to PayPal to pay

@mechanize @vcr @hostname
Scenario: Buy a gift code and send directly
  When I visit the gift code purchase page
  And I select a gifting option
  And I enter my details as the purchaser
  And I select to send the code directly to the recipient
  And I enter their details as the recipient
  And I click the "pay-with-paypal" button
  Then the gift code object should be created correctly in the database
  And I should be sent to PayPal to pay

Scenario: Buy a gift code but forget recipient details
  When I visit the gift code purchase page
  And I select a gifting option
  And I enter my details as the purchaser
  And I select to send the code directly to the recipient
  And I click the "pay-with-paypal" button
  Then I should see the "Gift Subscriptions" page
  And I should see an error telling me about missing recipient details

Scenario: Use button from homepage to buy gift
  When I visit the homepage
  And I click the "BUY A GIFT SUBSCRIPTION" link
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
  And the recipient should not receive an email
  
Scenario: Gift codes for today are emailed immediately
  Given I have created a gift code
  And I have selected the recipient to receive the gift code today
  And I have paid for the gift code with PayPal
  Then I should see the "Purchase Complete" page
  But I should not see a gift code
  And I should recieve an email reciept
  And the recipient should receive an email with their gift code
  
Scenario: Recipients get gift codes by email
  Given a gift code has been bought for me
  And it is due for delivery today
  When the gift codes are delivered
  Then I should receive an email with my gift code

Scenario: Emails are sent if they should have already been sent but haven't been
  Given a gift code has been bought for me
  And was due for delivery yesterday
  But has not been emailed yet
  When the gift codes are delivered
  Then I should receive an email with my gift code

Scenario: Emails are not sent until the right day
  Given a gift code has been bought for me
  And is due for delivery tomorrow
  When the gift codes are delivered
  Then I should not receive an email with my gift code

Scenario: Emails are only sent once
  Given a gift code has been bought for me
  And was due for delivery yesterday
  But has already been sent to me
  When the gift codes are delivered
  Then I should not receive an email with my gift code

Scenario: Gift codes aren't sent if not paid for
  Given a gift code has been bought for me
  And it is due for delivery today
  But the gift code was not paid for
  When the gift codes are delivered
  Then I should not receive an email with my gift code
