When(/^I visit the shipping list for the next pod$/) do
  visit pod_shipments_path(@next_pod)
end

When(/^I visit the shipping list for the current pod$/) do
  visit pod_shipments_path(@current_pod)
end

Then(/^I should see the user in the shipping list$/) do
  page.should have_text(@user.email)
  page.should have_text(@user.name)
  page.should have_text(@user.address_street)
  page.should have_text(@user.address_locality)
  page.should have_text(@user.address_postcode)
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
    And they should see "Hi #{CGI.escapeHTML(@user.name)}," in the email body
  }
end

Given(/^the current pod has been shipped to me$/) do
  FactoryGirl.create(:completed_shipment, user: @user, pod: @current_pod)
end

Given(/^the previous pod was shipped to me$/) do
  FactoryGirl.create(:completed_shipment, user: @user, pod: @previous_pod)
end

Given(/^the next pod has been shipped to me$/) do
  FactoryGirl.create(:completed_shipment, user: @user, pod: @next_pod)
end

Given(/^the current pod has not been shipped to me$/) do
  FactoryGirl.create(:pending_shipment, user: @user, pod: @current_pod)
end

Given(/^the previous pod was not shipped to me$/) do
  nil
end

Then(/^the pod for "(.*?)" should be shipped to me$/) do |date|
  pod = Pod.where(month: Date.parse(date).beginning_of_month)
  @user.subscriptions.active.payments.count.should == @user.shipments.count
  @user.shipments.where(pod_id: pod).count.should == 1
end

Then(/^the pod for "(.*?)" should not be shipped to me again$/) do |date|
  pod = Pod.where(month: Date.parse(date).beginning_of_month)
  @user.subscriptions.active.payments.count.should == @user.shipments.count
  @user.shipments.where(pod_id: pod).count.should == 1
end

Then(/^the pod for "(.*?)" should be not shipped to me$/) do |date|
  pod = Pod.where(month: Date.parse(date).beginning_of_month)
  @user.shipments.where(pod_id: pod).count.should == 0
end

Then(/^they should be listed as receiving organic seeds$/) do
  page.should have_text("Organic")
  page.should_not have_text("Standard")
end

Then(/^they should be listed as receiving non\-organic seeds$/) do
  page.should have_text("Standard")
  page.should_not have_text("Organic")
end