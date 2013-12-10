module PodsHelper

  def price_string(months, organic = false)
    "%.2f" % Pod.price(months: months, organic: organic)
  end

end
