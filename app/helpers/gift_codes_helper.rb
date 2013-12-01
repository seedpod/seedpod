module GiftCodesHelper

  def gift_code_lengths
    [3,6,9,12]
  end

  def gift_code_length_options_for_select
    gift_code_lengths.map do |length|
      ["#{length} Months", length]
    end
  end
  
  def discount_string(months)
    (Pod.discount(months: months) * 100).to_i.to_s + "%"
  end

end
