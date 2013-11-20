class GiftCodesController < ApplicationController

  def new
    @gift_code = GiftCode.new
  end

  private
  
  def gift_code_price_map
    {
      3  => 18.00,
      6  => 34.20,
      9  => 48.60,
      12 => 61.20,
    } 
  end
  helper_method :gift_code_price_map
  
end
