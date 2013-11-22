When(/^I visit the gift code purchase page$/) do
  visit new_gift_code_path
end

When(/^I select a gifting option$/) do
  select '6 Months - £34.20', from: 'gift_code[months]'
  @months = 6
end

When(/^I enter my details as the purchaser$/) do
  @purchaser_email = Faker::Internet.email
  @purchaser_name = Faker::Name.name
  fill_in 'gift_code[purchaser_name]', with: @purchaser_name
  fill_in 'gift_code[purchaser_email]', with: @purchaser_email
end

When(/^I select to receive the code myself$/) do
  select 'I would like to receive the gift code, and give the gift myself'
  @send_to_recipient = false
end

When(/^I select to send the code directly to the recipient$/) do
  select 'I would like the gift code to be emailed directly to the recipent'
  @send_to_recipient = true
end

When(/^I enter their details as the recipient$/) do
  @recipient_email = Faker::Internet.email
  @recipient_name = Faker::Name.name
  @send_date = 2.weeks.from_now.to_date
  fill_in 'gift_code[recipient_name]', with: @recipient_name
  fill_in 'gift_code[recipient_email]', with: @recipient_email
  fill_in 'gift_code[send_date]', with: @send_date
end

Then(/^the gift code object should be created correctly in the database$/) do
  GiftCode.count.should == 1
  code = GiftCode.first
  code.code.should =~ /^[0-9a-f]{8}$/
  code.months.should == @months
  code.purchaser_name.should == @purchaser_name.to_s
  code.purchaser_email.should == @purchaser_email.to_s
  code.send_to_recipient.should == @send_to_recipient
  code.recipient_name.should == @recipient_name.to_s
  code.recipient_email.should == @recipient_email.to_s
  code.send_date.should == @send_date
end

Given(/^I have created a gift code$/) do
  @gift_code = FactoryGirl.create(:gift_code)
end

Given(/^I have paid for the gift code with PayPal$/) do
  mock = Object.new
  mock.should_receive(:success?).and_return(true)
  PayPalGateway.should_receive(:purchase).with(61.2, {ip: "127.0.0.1", payer_id: "PAYER_ID", token: "TOKEN"}).once.and_return(mock)
  visit gift_code_confirm_path(@gift_code, token: 'TOKEN', PayerID: 'PAYER_ID')
end

Given(/^I the PayPal response was invalid$/) do
  mock = Object.new
  mock.should_receive(:success?).and_return(false)
  mock.should_receive(:message).and_return("PayPal exploded!")
  PayPalGateway.should_receive(:purchase).with(61.2, {ip: "127.0.0.1", payer_id: "PAYER_ID", token: "TOKEN"}).once.and_return(mock)
  visit gift_code_confirm_path(@gift_code, token: 'TOKEN', PayerID: 'PAYER_ID')
end

Given(/^I have cancelled the PayPal purchase$/) do
  visit gift_code_cancel_path(@gift_code, token: 'TOKEN', PayerID: 'PAYER_ID')
end

Then(/^the gift code should be marked as paid$/) do
  code = GiftCode.find_by_code(@gift_code.code)
  code.should be_paid
end

Then(/^the gift code should not be marked as paid$/) do
  code = GiftCode.find_by_code(@gift_code.code)
  code.should_not be_paid
end

Then(/^I should see an error from PayPal$/) do
  page.should have_text("PayPal exploded!")
end

Given(/^I have selected to receive the code myself$/) do
  @gift_code.update_attributes(send_to_recipient: false)
end

Given(/^I have selected the recipient to receive the gift code at a future date$/) do
  @gift_code.update_attributes(send_to_recipient: true)
end

Then(/^I should see a gift code$/) do
  page.should have_text @gift_code.code
end

Then(/^I should not see a gift code$/) do
  page.should_not have_text @gift_code.code
end

Then(/^I should recieve an email with the gift code$/) do
  steps %{
    Then "#{@gift_code.purchaser_email}" should receive an email
    When they open the email
    Then they should see "Your SeedPod Gift Code" in the email subject
    And they should see "#{@gift_code.code}" in the email body
    And they should see "#{@gift_code.months} months" in the email body
    And they should see "#{@gift_code.price_string}" in the email body
  }
end

Then(/^I should recieve an email reciept$/) do
  steps %{
    Then "#{@gift_code.purchaser_email}" should receive an email
    When they open the email
    Then they should see "Your SeedPod Gift Code Receipt" in the email subject
    And they should not see "#{@gift_code.code}," in the email body
    And they should see "#{@gift_code.months} months" in the email body
    And they should see "#{@gift_code.price_string}" in the email body
    And they should see "#{@gift_code.recipient_name}" in the email body
    And they should see "#{@gift_code.recipient_email}" in the email body
    And they should see "#{@gift_code.send_date.to_s(:long)}" in the email body
  }
end