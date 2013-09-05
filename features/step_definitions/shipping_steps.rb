When(/^I visit the shipping list for the next pod$/) do
  visit pod_shipments_path(@next_pod)
end

Then(/^I should see the user in the shipping list$/) do
  page.should have_text(@user.email)
end

Then(/^the shipment should be marked as shipped$/) do
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