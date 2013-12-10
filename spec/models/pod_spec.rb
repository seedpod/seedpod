require 'spec_helper'

describe Pod do
	  
  context "works out prices from months" do
    {
      1 => 5.95,
      3 => 17.85,
      6 => 33.92,
      9 => 48.20,
      12 => 60.69,
    }.each_pair do |period, price|
      it "costs #{price} for #{period} months" do
        Pod.price(months: period).should == price
      end
    end
  end

end
