module GiftCodesHelper

  def gift_code_options_for_select
    GiftCode.prices.map do |choice|
      ["#{choice[0]} Months - £%.2f" % choice[1], choice[0]]
    end
  end

end
