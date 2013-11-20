class GiftCodesController < ApplicationController

  def new
    @gift_code = GiftCode.new
  end

  def create
    @gift_code = GiftCode.create(gift_code_params)
    if @gift_code.valid?
      render :text => 'ok'
    else
      render :action => 'new'
    end
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
  
  def gift_code_params
    params[:gift_code].permit(:months, :purchaser_name, :purchaser_email, :send_to_recipient, :recipient_email, :recipient_name, :send_date)
  end

end
