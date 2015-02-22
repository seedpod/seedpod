Feature: Buying a small subscription
	In order to be able to purchase a small subscription
	As a member of the public
	I want to be able to choose a size option
	
Background:
  Given there is a pod for the current month
  And there is a pod for next month
  And the current pod has a crop "Carrots" which is "garden" "non-organic"
  And the current pod has a crop "Turnips" which is "small" "non-organic"
  And the current pod has a crop "Rocket" which is "large" "non-organic"
  And the current pod has a crop "Swedes" which is "garden" "non-organic"
  And that crop is also "small" "non-organic"
  And that crop is also "large" "non-organic"
  And the current pod has a crop "Sweetcorn" which is "garden" "organic"
  And the current pod has a crop "Chard" which is "small" "organic"
  And the current pod has a crop "Onions" which is "large" "organic"
  And the current pod has a crop "Peas" which is "garden" "organic"
  And that crop is also "small" "organic"
  And that crop is also "large" "organic"
  
@javascript
Scenario: Select small organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-Organic"
	Then I should see "£5.95 per month"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless small organic
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-Organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged "5.95" by GoCardless
	And my subscription should be marked as "small" "non-organic"

Scenario: shipping small organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "small" "organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving organic seeds
  And they should be listed as receiving "small" seeds
  And I should see "Chard"
  And I should see "Peas"
  And I should not see "Swedes"
  And I should not see "Onions"
		
Scenario: view small organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "small" "organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Chard"
  And I should see "Peas"
  And I should not see "Swedes"
  And I should not see "Onions"		

@javascript @mechanize @vcr @hostname
Scenario: Buying a small organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Balcony"
  And I select "Non-Organic"
	Then I should see "17.85"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "small"
  And the gift code should be marked as non-organic
  And I should be charged "17.85"
  And I should be charged for "3 month balcony or"
	
@javascript
Scenario: Using a small organic gift code
  Given a non-organic gift code has been bought for me
   And that gift code is "small"
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "small" "non-organic"

		
@javascript
Scenario: Select small non-organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-organic"
	Then I should see "£4.95 per month"
	
@mechanize @vcr @hostname
Scenario: Send to GoCardless small non-organic
  When I visit the sign up page
  And I fill in my details
	And I select "Balcony"
	And I select "Non-organic"
  And I click the "Proceed to secure GoCardless payment page" button
  Then I should be sent to gocardless to set up my subscription
	And I should be charged "4.95" by GoCardless
	And my subscription should be marked as "small" "non-organic"	
	
Scenario: shipping small non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "small" "non-organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving non-organic seeds
  And they should be listed as receiving "small" seeds
  And I should see "Turnips"
  And I should see "Swedes"	
	
Scenario: view small non-organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "small" "non-organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Turnips"
  And I should see "Swedes"
  And I should not see "Peas"
  And I should not see "Rocket"	
	
@javascript @mechanize @vcr @hostname
Scenario: Buying a small non-organic gift subscription
  When I visit the gift code purchase page
  And I select "3 Months"
  And I select "Balcony"
  And I select "Non-organic"
	Then I should see "14.85"
  When I enter my details as the purchaser
  And I click the "pay-with-paypal" button
  And the gift code should be marked as "small"
  And the gift code should be marked as non-organic
  And I should be charged "14.85"
  And I should be charged for "3 month balcony no"
	
@javascript
Scenario: Using a small non-organic gift code
  Given an non-organic gift code has been bought for me
    And that gift code is "small"
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "small" "non-organic"
	
	
#@javascript
#Scenario: Select large organic charged the right amount
#  When I visit the sign up page
#  And I fill in my details
#	And I select "Allotment"
#	And I select "Organic"
#	Then I should see "£8.45 per month"
	
#@mechanize @vcr @hostname
#Scenario: Send to GoCardless large organic
#  When I visit the sign up page
#  And I fill in my details
#	And I select "Allotment"
#	And I select "Organic"
#  And I click the "Proceed to secure GoCardless payment page" button
#  Then I should be sent to gocardless to set up my subscription
#	And I should be charged "8.45" by GoCardless
#	And my subscription should be marked as "large" "organic"

Scenario: shipping large organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "large" "organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving organic seeds
  And they should be listed as receiving "large" seeds
  And I should see "Onions"
  And I should see "Peas"

Scenario: view large organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "large" "organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Peas"
  And I should see "Onions"
  And I should not see "Chard"
  And I should not see "Sweetcorn"	

#@javascript @mechanize @vcr @hostname
#Scenario: Buying a large organic gift subscription
#  When I visit the gift code purchase page
#  And I select "3 Months"
#  And I select "Allotment"
#  And I select "Organic"
#	Then I should see "25.35"
#  When I enter my details as the purchaser
#  And I click the "pay-with-paypal" button
#  And the gift code should be marked as "large"
#  And the gift code should be marked as organic
#  And I should be charged "25.35"
#  And I should be charged for "3 month allotment or"

@javascript
Scenario: Using an large organic gift code
  Given an organic gift code has been bought for me
    And that gift code is "large"
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "large" "organic"


#@javascript
#Scenario: Select large non-organic charged the right amount
#  When I visit the sign up page
#  And I fill in my details
#	And I select "Allotment"
#	And I select "Non-organic"
#	Then I should see "£7.45 per month"

#@mechanize @vcr @hostname
#Scenario: Send to GoCardless large non-organic
#  When I visit the sign up page
#  And I fill in my details
#	And I select "Allotment"
#	And I select "Non-organic"
#  And I click the "Proceed to secure GoCardless payment page" button
#  Then I should be sent to gocardless to set up my subscription
#	And I should be charged the "7.45" by GoCardless
#	And my subscription should be marked as "large" "non-organic"
	
Scenario: shipping large non-organic
  Given I am signed in as an administrator
  And there is a user
  And the subscription is "large" "non-organic"
  And that user has paid for the current pod
  When I visit the shipping list for the current pod
  Then I should see the user in the shipping list
  And they should be listed as receiving non-organic seeds
  And they should be listed as receiving "large" seeds
  And I should see "Rocket"
  And I should see "Swedes"	
	
Scenario: view large non-organic advice
  Given I am signed in
  And I have a subscription set up
  And the subscription is "large" "non-organic"
  And I have paid for the current pod
  And the current pod has been shipped to me
  When I visit the current pod
  Then I should see content for the current pod
  And I should see "Rocket"
  And I should see "Swedes"
  And I should not see "Carrots"
  And I should not see "Onions"		
	
#@javascript @mechanize @vcr @hostname
#Scenario: Buying a large non-organic gift subscription
#  When I visit the gift code purchase page
#  And I select "3 Months"
#  And I select "Allotment"
#  And I select "Non-organic"
#	Then I should see "22.35"
#  When I enter my details as the purchaser
#  And I click the "pay-with-paypal" button
#  And the gift code should be marked as "large"
#  And the gift code should be marked as non-organic
#  And I should be charged "22.35"
#  And I should be charged for "3 month allotment no"	
	
@javascript
Scenario: Using an large non-organic gift code
  Given an non-organic gift code has been bought for me
    And that gift code is "large"
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then the gift code should be associated with my subscription
	And my subscription should be marked as "large" "non-organic"


