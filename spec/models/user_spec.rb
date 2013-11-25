require 'spec_helper'

describe User do
    
  it "allows empty gift codes" do
    # nil
    u = FactoryGirl.build(:user, gift_code: nil)
    u.should be_valid
    u.errors.should_not include(:gift_code)
    # empty string
    u = FactoryGirl.build(:user, gift_code: '')
    u.should be_valid
    u.errors.should_not include(:gift_code)
  end

  it "disallows made up gift codes" do
    u = FactoryGirl.build(:user, gift_code: 'deadc0de')
    u.should_not be_valid
    u.errors.should include(:gift_code)
    u.errors.full_messages_for(:gift_code).should == ["Gift code does not exist"]
  end

  it "disallows unpaid gift codes" do
    code = FactoryGirl.create(:gift_code, paid: false)
    u = FactoryGirl.build(:user, gift_code: code.code)
    u.should_not be_valid
    u.errors.should include(:gift_code)
    u.errors.full_messages_for(:gift_code).should == ["Gift code does not exist"]
  end

  it "disallows already allocated gift codes" do
    code = FactoryGirl.create(:gift_code, paid: true)
    sub = FactoryGirl.create(:subscription, gift_code: code)
    u = FactoryGirl.build(:user, gift_code: code.code)
    u.should_not be_valid
    u.errors.should include(:gift_code)
    u.errors.full_messages_for(:gift_code).should == ["Gift code has already been used"]
  end

end
