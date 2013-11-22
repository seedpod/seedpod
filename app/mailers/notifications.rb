class Notifications < ActionMailer::Base
  default from: 'greetings@getseedpod.com', bcc: 'admin@getseedpod.com'
  
  def welcome(user)
    @greeting = "Hi #{user.name},"
    mail to: user.email
  end

  def shipped(user)
    @greeting = "Hi #{user.name},"
    mail to: user.email
  end

  def gift_code_receipt_without_recipient(gift_code)
    @code = gift_code.code
    @months = gift_code.months
    @price = gift_code.price_string
    mail to: gift_code.purchaser_email
  end
  
  def gift_code_receipt_with_recipient(gift_code)
    @months = gift_code.months
    @price = gift_code.price_string
    @recipient_name = gift_code.recipient_name
    @recipient_email = gift_code.recipient_email
    @send_date = gift_code.send_date
    mail to: gift_code.purchaser_email
  end

end
