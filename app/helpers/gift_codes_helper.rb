module GiftCodesHelper

  def gift_code_lengths
    [3,6,9,12]
  end

  def gift_code_options_for_select
    gift_code_lengths.map do |length|
      ["#{length} Months - £%.2f" % Pod.price(months: length), length]
    end
  end

  def discount_string(months)
    (Pod.discount(months: months) * 100).to_i.to_s + "%"
  end

  def price_string(months, organic = false)
    "%.2f" % Pod.price(months: months, organic: organic)
  end

end
