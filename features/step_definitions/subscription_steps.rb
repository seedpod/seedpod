Then(/^my subscription details should be stored$/) do
  # Check subscription ID
  User.find(@user.id).subscription_id.should == 'ABC123'
end
