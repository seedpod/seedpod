Then(/^I should be sent to PayPal to pay$/) do
  page.current_host.should == "https://paypal.com"
  page.current_path.should == ""
end
