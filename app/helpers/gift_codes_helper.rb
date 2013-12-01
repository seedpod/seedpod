module GiftCodesHelper

  def gift_code_options_for_select
    [3,6,9,12].map do |length|
      ["#{length} Months - £%.2f" % Pod.price(months: length), length]
    end
  end

end
