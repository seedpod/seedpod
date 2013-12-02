Feature: Buying organic subscription
	In order to be able to purchase an organic subscription
	As a member of the public
	I want to be able to choose an organic option

Background:
  Given there is a pod for the current month
  And there is a pod for next month
	
@javascript
Scenario: Select organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Organic"
	Then I should see "£7.00"
	
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
	And I select "Standard"
	Then I should see "£6.00"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless non-organic
  When I visit the sign up page
  And I fill in my details
	And I select "Standard"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the non-organic amount
	And my subscription should be marked as non-organic

Scenario: purchase and receive organic
	Given that I have purchased an organic seedpod
	And my pod has not yet been shipped
	Then I should be visisble on the shipments page
	And I should be tagged as having the organic shipment
	
Scenario: paying and getting organic pod
	Given that I have paid for this months pod
	And I have paid the organic price
	Then I should be tagged as having paid for this month's organic pod
	
Scenario: view organic advice
	Given that I have paid for this month's organic pod
	And my pod has been shipped
	Then I should see this month's organic advice
	
@javascript
Scenario: Buying an organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Organic"
	Then I should see "£21.00"
	
@javascript
Scenario: Buying an non-organic gift subscription
  When I visit the gift code purchase page
  And I select "6 Months"
  And I select "Standard"
	Then I should see "£34.20"

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
