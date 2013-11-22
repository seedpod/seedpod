require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the GiftCodesHelper. For example:
#
# describe GiftCodesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe GiftCodesHelper do

  it "should generate options for gift code selection properly" do
    helper.gift_code_options_for_select.should == [
      [ "3 Months - £18.00", 3 ],
      [ "6 Months - £34.20", 6 ],
      [ "9 Months - £48.60", 9 ],
      ["12 Months - £61.20", 12],
    ]
  end

end
