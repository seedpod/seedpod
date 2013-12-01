require 'spec_helper'

describe Pod do
	  
  context "works out prices from months" do
    {
      1 => 6.00,
      3 => 18.00,
      6 => 34.20,
      9 => 48.60,
      12 => 61.20,
    }.each_pair do |period, price|
      it "costs #{price} for #{period} months" do
        Pod.price(months: period).should == price
      end
    end
  end

end
