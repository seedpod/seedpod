class GiftCodesController < ApplicationController

  def new
    @gift_code = GiftCode.new
  end

end
