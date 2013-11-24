if ENV['PAYPAL_API_USERNAME']

  ActiveMerchant::Billing::Base.mode = :test unless Rails.env.production?

  paypal_options = {
    login: ENV['PAYPAL_API_USERNAME'],
    password: ENV['PAYPAL_API_PASSWORD'],
    signature: ENV['PAYPAL_API_SIGNATURE']
  }
  ::PayPalGateway = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)

end