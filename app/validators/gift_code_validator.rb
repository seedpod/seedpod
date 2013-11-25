class GiftCodeValidator < ActiveModel::EachValidator  
  
  def validate_each(record, attribute, value)
    # Allow nil and empty string
    return if value.nil? || value == ''
    # Check codes
    code = GiftCode.where(code: value).first
    if code.nil?
      record.errors[attribute] << "does not exist" 
    else 
      record.errors[attribute] << "does not exist" if !code.paid?
      record.errors[attribute] << "has already been used" if code.subscription
    end
  end

end