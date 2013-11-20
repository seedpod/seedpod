require 'spec_helper'

describe GiftCode do
	  
  it "can be created with just a number of months" do
  	code = GiftCode.create(months: 3)
    code.should be_valid
  	code.months.should == 3
  end

  it "automatically creates hex codes" do
    code = GiftCode.create(months: 3)
    code.code.should =~ /^[a-f0-9]{8}$/
  end

end