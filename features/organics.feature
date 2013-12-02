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

Scenario: shipping organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is organic
  And that user has paid for the next pod
  When I visit the shipping list for the next pod
  Then I should see the user in the shipping list
  And they should be listed as receiving organic seeds
  	
Scenario: shipping non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is non-organic
  And that user has paid for the next pod
  When I visit the shipping list for the next pod
  Then I should see the user in the shipping list
  And they should be listed as receiving non-organic seeds
	
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