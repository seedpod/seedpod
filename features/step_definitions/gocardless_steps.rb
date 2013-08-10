Then(/^I should be sent to gocardless to set up my subscription$/) do
  page.current_host.should == "https://sandbox.gocardless.com"
  page.current_path.should == "/connect/subscriptions/new"
end

When(/^GoCardless sends a subscription confirmation$/) do
  options = {
    resource_uri:  "http://gocardless.com/subscriptions/ABC123",
    resource_id:   "ABC123",
    resource_type: "subscription",
    signature:     "blah",
    state:         "#{@user.id}",
  }
  GoCardless.should_receive(:confirm_resource).once.and_return(true)
  url = confirm_user_subscription_path(@user)+'?'+options.to_query
  visit url
end