require 'spec_helper'

describe GiftCode do
	  
  it "can be created with just a number of months and purchaser details" do
    code = GiftCode.create(months: 3, purchaser_name: Faker::Name.name, purchaser_email: Faker::Internet.email, send_to_recipient: false)
    code.should be_valid
  	code.months.should == 3
  end

  it "requires recipient details if sending to recipient" do
    code = GiftCode.create(months: 3, purchaser_name: Faker::Name.name, purchaser_email: Faker::Internet.email, send_to_recipient: true)
    code.should_not be_valid
  	code.errors.messages.keys.should include(:recipient_name)
  	code.errors.messages.keys.should include(:recipient_email)
  	code.errors.messages.keys.should include(:send_date)
    code.recipient_name = Faker::Name.name
    code.recipient_email = Faker::Internet.email
    code.send_date = 2.weeks.from_now.to_date
    code.should be_valid
  end

  it "automatically creates hex codes" do
    code = GiftCode.create(months: 3)
    code.code.should =~ /^[a-f0-9]{8}$/
  end

  it "calculates prices from months" do
    code = GiftCode.create(months: 3)
    code.price.should == 18.0
  end

end
