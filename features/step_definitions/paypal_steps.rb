Then(/^I should be sent to PayPal to pay$/) do
  page.current_host.should == "https://www.sandbox.paypal.com"
  page.current_path.should == "/cgi-bin/webscr"
end

When(/^I should be charged "(.*?)"$/) do |amount|
  page.should have_text(amount)
end

When(/^I should be charged for "(.*?)"$/) do |description|
  page.should have_text(description)
end