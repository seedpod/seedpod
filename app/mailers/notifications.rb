class Notifications < ActionMailer::Base
  include PodsHelper
  
  default from: 'greetings@getseedpod.com', bcc: 'admin@getseedpod.com'
  
  def welcome(user)
    @greeting = "Hi #{user.name},"
    mail to: user.email
  end

  def shipped(user)
    @greeting = "Hi #{user.name},"
    mail to: user.email
  end

  def gift_code_receipt_without_recipient(code)
    @code = code.code
    @months = code.months
    @price = price_string(code.months)
    @purchaser_name = code.purchaser_name
    mail to: code.purchaser_email
  end
  
  def gift_code_receipt_with_recipient(code)
    @months = code.months
    @price = price_string(code.months)
    @recipient_name = code.recipient_name
    @recipient_email = code.recipient_email
    @send_date = code.send_date
    mail to: code.purchaser_email
  end

  def gift_code(code)
    @code = code.code
    @months = code.months
    @recipient_name = code.recipient_name
    @purchaser_name = code.purchaser_name
    mail to: code.recipient_email
  end

end
