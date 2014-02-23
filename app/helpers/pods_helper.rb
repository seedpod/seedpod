module PodsHelper

  def price_string(months, organic = false, size = "medium")
    "%.2f" % Pod.price(months: months, organic: organic, size: size)
  end

end
