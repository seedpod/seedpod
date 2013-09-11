Then(/^my payment should be recorded$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.transacted_at.should == DateTime.new(2013,8,10,12,0,0)
  payment.amount.should        == 6.0
  payment.state.should         == "paid"
end

Then(/^my payment should be recorded as failed$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.state.should         == "failed"
end

Given(/^I have made a payment$/) do
  FactoryGirl.create :payment, subscription: @subscription
end

Given(/^I have made a payment which failed$/) do
  FactoryGirl.create :payment, subscription: @subscription, state: 'failed'
end

Then(/^the payment should be marked as refunded$/) do
  @payment = @subscription.payments.last
  @payment.gocardless_id.should == 'XYZ987'
  @payment.state.should         == "refunded"
end

Then(/^my payment should be recorded as pending$/) do
  @payment = @subscription.payments.last
  @payment.gocardless_id.should == 'XYZ987'
  @payment.state.should         == "pending"
end

Then(/^my payment should be recorded as retrying$/) do
  @payment = @subscription.payments.last
  @payment.gocardless_id.should == 'XYZ987'
  @payment.state.should         == "retrying"
end

Given(/^I have paid for the current pod$/) do
  payment = FactoryGirl.create :payment, subscription: @subscription, state:"pending", pod: @current_pod
  payment.paid!(6, 1.month.ago)
end

Given(/^I have paid for the previous pod$/) do
  payment = FactoryGirl.create :payment, subscription: @subscription, state:"pending", pod: @previous_pod
  payment.paid!(6, Date.today)
end

Given(/^I have paid for the next pod$/) do
  payment = FactoryGirl.create :payment, subscription: @subscription, state:"pending", pod: @next_pod
  payment.paid!(6, Date.today)
end

Given(/^that user has paid for the next pod$/) do
  steps %{
    Given I have paid for the next pod
  }
end

Given(/^I have not yet paid for any pods$/) do
  @user.subscriptions.active.payments.should be_empty
end

Then(/^I should receive a welcome email$/) do
  steps %{
    Then I should receive an email
    When I open the email
    Then I should see "Welcome to SeedPod!" in the email subject
    And I should see "Hi #{@user.name}," in the email body
  }
end

Then(/^I should not receive a welcome email$/) do
  steps %{
    Then I should have no emails
  }
end

Then(/^my payment should be marked for this month's pod$/) do
  @payment.pod.should == @current_pod
end

Then(/^my payment should be marked for next month's pod$/) do
  @payment.pod.should == @next_pod
end