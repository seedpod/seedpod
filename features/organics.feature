Feature: Buying organic subscription
	In order to be able to purchase an organic subscription
	As a member of the public
	I want to be able to choose an organic option
	
@javascript
Scenario: Select organic charged the right amount
  When I visit the sign up page
  And I fill in my details
	And I select "Organic"
	Then I should see "£7.00"
	
Scenario: Send to GoCardless
	When I select organic option
	And I have entered my email address
	And I have entered my password
	And I have entered my name
	And I have entered my address
	And I have confirmed my password
	And I have entered my postcode
	And I click the Proceed to secure GoCardless payment page
	Then I should be redirected to GoCardless 
	And I should be charged the organic amount

@javascript
Scenario: Buy a non-organic option
  When I visit the sign up page
  And I fill in my details
	And I select "Standard"
	Then I should see "£6.00"
	
Scenario: Send to GoCardless non-organic
	When I select non-organic option
	And I have entered my email address
	And I have entered my password
	And I have entered my name
	And I have entered my address
	And I have confirmed my password
	And I have entered my postcode
	And I click the Proceed to secure GoCardless payment page
	Then I should be redirected to GoCardless 
	And I should be charged the non-organic amount

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
	
Scenario: Buying an organic gift subscription
	Given that I am on the buy a gift page
	And that I have selected the organic option
	Then I should see the organic price options
	
Scenario: Using an organic gift code
	Given that I enter an organic gift code
	And I have entered all other details
	Then I should have an instant "paid for organic current month pod" tag 


