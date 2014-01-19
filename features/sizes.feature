Feature: Buying a balcony subscription
	In order to be able to purchase a balcony subscription
	As a member of the public
	I want to be able to choose a size option
	
Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And the current pod has a crop "Carrots" which is "garden" "non-organic"
  And the current pod has a crop "Turnips" which is "balcony" "non-organic"
  And the current pod has a crop "Rocket" which is "allotment" "non-organic"
  And the current pod has a crop "Swedes" which is "garden" "non-organic"
  And that crop is also "balcony" "non-organic"
  And that crop is also "allotment" "non-organic"
  And the current pod has a crop "Sweetcorn" which is "garden" "organic"
  And the current pod has a crop "Chard" which is "balcony" "organic"
  And the current pod has a crop "Onions" which is "allotment" "organic"
  And the current pod has a crop "Peas" which is "garden" "organic"
  And that crop is also "balcony" "organic"
  And that crop is also "allotment" "organic"
  
@javascript
Scenario: Select balcony organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Organic"
	Then I should see "just £5.95 per month"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless balcony organic
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the "balcony" "organic" amount
	And my subscription should be marked as "balcony" "organic"

Scenario: shipping balcony organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "balcony" "organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving "balcony" "organic" seeds
  And I should see "Chard"
  And I should see "Peas"
		
Scenario: view balcony organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "balcony" "organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Chard"
  And I should see "Peas"
  And I should not see "Sweeds"
  And I should not see "Onions"		

@javascript @mechanize @vcr @hostname
Scenario: Buying a balcony organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Balcony"
  And I select "Organic"
	Then I should see "17.85"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "balcony" "organic"
  And I should be charged "17.85"
  And I should be charged for "3 month balcony organic"
	
@javascript
Scenario: Using a balcony organic gift code
  Given a "balcony" "organic" gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "balcony" "organic"

		
@javascript
Scenario: Select balcony non-organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-organic"
	Then I should see "just £4.95 per month"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless balcony non-organic
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the "balcony" "non-organic" amount
	And my subscription should be marked as "balcony" "non-organic"	
	
Scenario: shipping balcony non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "balcony" "non-organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving "balcony" "non-organic" seeds
  And I should see "Turnips"
  And I should see "Swedes"	
	
Scenario: view balcony non-organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "balcony" "non-organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Turnips"
  And I should see "Swedes"
  And I should not see "Peas"
  And I should not see "Rocket"	
	
@javascript @mechanize @vcr @hostname
Scenario: Buying a balcony non-organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Balcony"
  And I select "Non-organic"
	Then I should see "14.85"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "balcony" "non-organic"
  And I should be charged "14.85"
  And I should be charged for "3 month balcony non-organic"
	
@javascript
Scenario: Using a balcony non-organic gift code
  Given a "balcony" "non-organic" gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "balcony" "non-organic"
	
	
@javascript
Scenario: Select allotment organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Allotment"
	And I select "Organic"
	Then I should see "just £8.45 per month"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless allotment organic
  When I visit the sign up page
  And I fill in my details
	And I select "Allotment"
	And I select "Organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the "allotment" "organic" amount
	And my subscription should be marked as "allotment" "organic"

Scenario: shipping allotment organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "allotment" "organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving "allotment" "organic" seeds
  And I should see "Onions"
  And I should see "Peas"

Scenario: view allotment organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "allotment" "organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Peas"
  And I should see "Onions"
  And I should not see "Chard"
  And I should not see "Sweetcorn"	

@javascript @mechanize @vcr @hostname
Scenario: Buying a allotment organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Allotment"
  And I select "Organic"
	Then I should see "25.35"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "allotment" "organic"
  And I should be charged "25.35"
  And I should be charged for "3 month allotment organic"

@javascript
Scenario: Using an allotment organic gift code
  Given an "allotment" "organic" gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "allotment" "organic"


@javascript
Scenario: Select allotment non-organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Allotment"
	And I select "Non-organic"
	Then I should see "just £7.45 per month"

@mechanize @vcr @hostname
Scenario: Send to GoCardless allotment non-organic
  When I visit the sign up page
  And I fill in my details
	And I select "Allotment"
	And I select "Non-organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged the "allotment" "non-organic" amount
	And my subscription should be marked as "allotment" "non-organic"
	
Scenario: shipping allotment non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "allotment" "non-organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving "allotment" "non-organic" seeds
  And I should see "Rocket"
  And I should see "Swedes"	
	
Scenario: view allotment non-organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "allotment" "non-organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Rocket"
  And I should see "Swedes"
  And I should not see "Carrots"
  And I should not see "Onions"		
	
@javascript @mechanize @vcr @hostname
Scenario: Buying a allotment non-organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Allotment"
  And I select "Non-organic"
	Then I should see "22.35"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "allotment" "non-organic"
  And I should be charged "22.35"
  And I should be charged for "3 month allotment non-organic"	
	
@javascript
Scenario: Using an allotment non-organic gift code
  Given an "allotment" "non-organic" gift code has been bought for me
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "allotment" "non-organic"

