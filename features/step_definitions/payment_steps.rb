Then(/^my payment should be recorded$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.paid_at.should       == DateTime.new(2013,8,10,12,0,0)
  payment.amount.should        == 6.0
  payment.success.should       == true
end

Then(/^my payment should be recorded as failed$/) do
  payment = @subscription.payments.last
  payment.gocardless_id.should == 'XYZ987'
  payment.paid_at.should       == DateTime.new(2013,8,10,12,0,0)
  payment.success.should       == false
end