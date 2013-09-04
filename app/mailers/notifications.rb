class Notifications < ActionMailer::Base
  default from: 'paul@getseedpod.com'
  
  def shipped(user)
    
    @greeting = "Hi #{user.name},"
    
    mail to: user.email
  end
  
end
