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
  
end
