class GiftCodesController < ApplicationController

  def new
    @gift_code = GiftCode.new
  end

  def create
    @gift_code = GiftCode.create(gift_code_params)
    if @gift_code.valid?
      redirect_to paypal_checkout_url
    else
      render :action => 'new'
    end
  end

  private
  
  def gift_code_params
    params[:gift_code].permit(:months, :purchaser_name, :purchaser_email, :send_to_recipient, :recipient_email, :recipient_name, :send_date)
  end

  def paypal_checkout_url
    response = PayPalGateway.setup_purchase(
      @gift_code.price*100,
      ip: request.remote_ip,
      return_url: gift_code_confirm_url(@gift_code),
      cancel_return_url: gift_code_cancel_url(@gift_code),
      currency: 'GBP',
      locale: I18n.locale.to_s.sub(/-/, '_'),
      brand_name: "SeedPod",
      :'header_image' => 'http://getseedpod.com/assets/icon-hdpi.png',
      allow_guest_checkout: 'true',
      items: [{
        name: "SeedPod Gift Code", 
        description: @gift_code.description, 
        quantity: "1", 
        amount: @gift_code.price*100
      }]
    )
    PayPalGateway.redirect_url_for(response.token)
  end

end
