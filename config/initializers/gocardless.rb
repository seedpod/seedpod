if ENV['GOCARDLESS_APP_ID']
  GoCardless.account_details = {
    :app_id      => ENV['GOCARDLESS_APP_ID'],
    :app_secret  => ENV['GOCARDLESS_APP_SECRET'],
    :token       => ENV['GOCARDLESS_APP_TOKEN'],
    :merchant_id => ENV['GOCARDLESS_APP_MERCHANT']
  }
end