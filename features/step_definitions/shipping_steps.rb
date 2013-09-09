When(/^I visit the shipping list for the next pod$/) do
  visit pod_shipments_path(@next_pod)
end

Then(/^I should see the user in the shipping list$/) do
  page.should have_text(@user.email)
end

Then(/^the shipment should be marked as shipped$/) do
  sleep(0.1) # wait for ajax action to happen before checking result
  @user.shipments.first.shipped.should be_true
  page.should have_text("Shipped")
end

Then(/^the user should get a shipped email$/) do
  steps %{
    Then "#{@user.email}" should receive an email
    When they open the email
    Then they should see "Your SeedPod is on its way!" in the email subject
    And they should see "Hi #{@user.name}," in the email body
  }
end

Given(/^the current pod has been shipped to me$/) do
  FactoryGirl.create(:completed_shipment, user: @user, pod: @current_pod)
end

Given(/^the previous pod was shipped to me$/) do
  FactoryGirl.create(:completed_shipment, user: @user, pod: @previous_pod)
end

Given(/^the current pod has not been shipped to me$/) do
  FactoryGirl.create(:pending_shipment, user: @user, pod: @current_pod)
end