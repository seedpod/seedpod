Feature: Buying organic subscription
	In order to be able to purchase an organic subscription
	As a member of the public
	I want to be able to choose an organic option

Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And the current pod has a crop "Carrots" which is organic
  And the current pod has a crop "Turnips" which is non-organic
  And the current pod has a crop "Swedes" which is organic and non-organic
  	
@javascript
Scenario: Select organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Organic - £7.00 per month"
	Then I should see "just £7.00 (inc. VAT)"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless
  When I visit the sign up page
  And I fill in my details
	And I select "Organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the organic amount
	And my subscription should be marked as organic

@javascript
Scenario: Buy a non-organic option
  When I visit the sign up page
  And I fill in my details
	And I select "Standard - £6.00 per month"
	Then I should see "just £6.00 (inc. VAT)"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless non-organic
  When I visit the sign up page
  And I fill in my details
	And I select "Standard"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the non-organic amount
	And my subscription should be marked as non-organic

Scenario: shipping organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is organic
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving organic seeds
  And I should see "Carrots"
  And I should see "Swedes"
  	
Scenario: shipping non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is non-organic
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving non-organic seeds
  And I should see "Swedes"
  And I should see "Turnips"
	
Scenario: view organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is organic
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Carrots"
  And I should see "Swedes"
  And I should not see "Turnips"
	
Scenario: view non-organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is non-organic
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should not see "Carrots"
  And I should see "Swedes"
  And I should see "Turnips"

@javascript @mechanize @vcr @hostname
Scenario: Buying an organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Organic"
	Then I should see "£21.00"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as organic
  And I should be charged "£21.00"
  And I should be charged for "3 month organic"
	
@javascript @mechanize @vcr @hostname
Scenario: Buying an non-organic gift subscription
  When I visit the gift code purchase page
  And I select "6 Months"
  And I select "Standard"
	Then I should see "£34.20"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as non-organic
  And I should be charged "£34.20"
  And I should be charged for "6 month standard"

@javascript
Scenario: Using an organic gift code
  Given an organic gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as organic

@javascript
Scenario: Using a non-organic gift code
  Given an non-organic gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as non-organic
