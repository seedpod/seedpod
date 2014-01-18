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

  it "generates future pods automatically" do
    Pod.delete_all
    Pod.generate_future_pods!
    Pod.count.should == 12
    Pod.first.month.should == Date.today.beginning_of_month
    Pod.last.month.should == (Date.today + 11.months).beginning_of_month
  end

  it "doesn't double-generate pods" do
    Pod.delete_all
    Pod.generate_future_pods!
    Pod.count.should == 12
    Pod.generate_future_pods!
    Pod.count.should == 12
  end

end
