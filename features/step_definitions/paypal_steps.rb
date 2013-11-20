Then(/^I should be sent to PayPal to pay$/) do
  page.current_host.should == "https://www.sandbox.paypal.com"
  page.current_path.should == "/cgi-bin/webscr"
end
