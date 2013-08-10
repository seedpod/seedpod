Then(/^my subscription details should be stored$/) do
  # Check subscription ID
  User.find(@user.id).subscriptions.active.gocardless_id.should == 'ABC123'
end
