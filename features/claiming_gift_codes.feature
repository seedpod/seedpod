Feature: Claiming gift codes
  In order to be able to receive seedpod as a gift
  As a gift code recipient
  I want to be able to apply the gift code to my account

@javascript
Scenario: Sign up with a gift code
  Given a gift code has been bought for me
  And there is a pod for the current month
  And there is a pod for next month
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then I should see the getting started page
  And I should not see a subscription warning
  And the gift code should be associated with my subscription

@javascript
Scenario: Sign up with a made-up gift code
  When I visit the sign up page
  And I fill in my details
  And I enter a made-up gift code
  And I click the "Join SeedPod" button
  Then I should see the "Account Details" page
  And I should see an invalid gift code error

@javascript
Scenario: Sign up with an unpaid gift code
  Given a gift code has been bought for me
  But the gift code was not paid for
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then I should see the "Account Details" page
  And I should see an invalid gift code error

@javascript
Scenario: Sign up with a gift code that's already been used
  Given a gift code has been bought for me
  But the gift code has already been used
  When I visit the sign up page
  And I fill in my details
  And I enter my gift code
  And I click the "Join SeedPod" button
  Then I should see the "Account Details" page
  And I should see an already-used gift code error

@timecop
Scenario: Generate gift code shipments correctly
  Given a gift code has been bought for me
  And the gift code lasts for 3 months
  And there is a pod for "2013-09-01"
  And there is a pod for "2013-10-01"
  And there is a pod for "2013-11-01"
  And there is a pod for "2013-12-01"
  And the date is "2013-09-10"
  And I claim the gift code when I sign up
  Then the pod for "2013-09-01" should be shipped to me
  When the date is "2013-09-11"
  And the gift code shipment generator runs
  Then the pod for "2013-09-01" should not be shipped to me again
  When the date is "2013-10-10"
  And the gift code shipment generator runs
  Then the pod for "2013-10-01" should be shipped to me
  When the date is "2013-11-10"
  And the gift code shipment generator runs
  Then the pod for "2013-11-01" should be shipped to me
  When the date is "2013-12-10"
  And the gift code shipment generator runs
  Then the pod for "2013-12-01" should be not shipped to me
