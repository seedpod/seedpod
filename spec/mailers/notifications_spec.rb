require "spec_helper"

describe Notifications do
  describe "shipped" do
    
    before :all do
      @user = FactoryGirl.create(:user)
    end
    
    let(:mail) { Notifications.shipped(@user) }

    it "renders the headers" do
      mail.subject.should eq("Your SeedPod is on its way!")
      mail.to.should eq([@user.email])
      mail.from.should eq(["greetings@getseedpod.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi #{@user.name},")
    end
  end

end
