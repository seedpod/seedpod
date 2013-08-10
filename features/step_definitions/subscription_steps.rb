Then(/^my subscription details should be stored$/) do
  # Check subscription ID
  User.find(@user.id).subscriptions.active.gocardless_id.should == 'ABC123'
end

Given(/^I have a subscription set up$/) do
  @subscription = FactoryGirl.create :subscription, user: @user
end

Then(/^my subscription should be marked as cancelled$/) do
  sub = Subscription.find(@subscription.id)
  sub.cancelled_at.should_not be_nil
end