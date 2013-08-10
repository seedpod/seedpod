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

Then(/^the payment should be marked as refunded$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.state.should         == "refunded"
end

Then(/^my payment should be recorded as pending$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.state.should         == "pending"
end

Then(/^my payment should be recorded as retrying$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.state.should         == "retrying"
end