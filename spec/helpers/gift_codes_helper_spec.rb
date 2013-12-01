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
    helper.gift_code_length_options_for_select.should == [
      [ "3 Months", 3 ],
      [ "6 Months", 6 ],
      [ "9 Months", 9 ],
      ["12 Months", 12],
    ]
  end

end
