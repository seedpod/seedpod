Then(/^I should be sent to gocardless to set up my subscription$/) do
  page.current_host.should == "https://sandbox.gocardless.com"
  page.current_path.should == "/connect/subscriptions/new"
end

When(/^GoCardless sends a subscription confirmation$/) do
  options = {
    resource_uri:  "http://gocardless.com/subscriptions/ABC123",
    resource_id:   "ABC123",
    resource_type: "subscription",
    signature:     "blah",
    state:         "#{@user.id}",
  }
  GoCardless.should_receive(:confirm_resource).once.and_return(true)
  url = confirm_user_subscription_path(@user)+'?'+options.to_query
  visit url
end

When(/^GoCardless sends a subscription cancellation$/) do
  # Sample payload from gocardless
  payload           = {
    "resource_type" => "subscription",
    "action"        => "cancelled",
    "subscriptions" => [{
      "id"          => "ABC123",
      "status"      => "cancelled",
      "uri"         => "https://gocardless.com/api/v1/subscriptions/ABC123"
    }],
    "signature"     => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a subscription expiry notification$/) do
  # Sample payload from gocardless
  payload           = {
    "resource_type" => "subscription",
    "action"        => "expired",
    "subscriptions" => [{
      "id"          => "ABC123",
      "status"      => "expired",
      "uri"         => "https://gocardless.com/api/v1/subscriptions/ABC123"
    }],
    "signature"     => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a bill paid notification$/) do
  # Sample payload from gocardless
  payload                 = {
    "resource_type"       => "bill",
    "action"              => "paid",
    "bills"               => [{
      "id"                => "XYZ987",
      "status"            => "paid",
      "source_type"       => "subscription",
      "source_id"         => "ABC123",
      "amount"            => "6.0",
      "amount_minus_fees" => "5.8",
      "paid_at"           => "2013-08-10T12:00:00Z",
      "uri"               => "https://gocardless.com/api/v1/bills/XYZ987"
    }],
    "signature"           => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a bill failed notification$/) do
  # Sample payload from gocardless
  payload                 = {
    "resource_type"       => "bill",
    "action"              => "failed",
    "bills"               => [{
      "id"                => "XYZ987",
      "status"            => "failed",
      "source_type"       => "subscription",
      "source_id"         => "ABC123",
      "amount"            => "6.0",
      "amount_minus_fees" => "5.8",
      "paid_at"           => "2013-08-10T12:00:00Z",
      "uri"               => "https://gocardless.com/api/v1/bills/XYZ987"
    }],
    "signature"           => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a bill chargeback notification$/) do
  # Sample payload from gocardless
  payload                 = {
    "resource_type"       => "bill",
    "action"              => "chargeback",
    "bills"               => [{
      "id"                => "XYZ987",
      "status"            => "chargeback",
      "source_type"       => "subscription",
      "source_id"         => "ABC123",
      "amount"            => "6.0",
      "amount_minus_fees" => "5.8",
      "paid_at"           => "2013-08-10T12:00:00Z",
      "uri"               => "https://gocardless.com/api/v1/bills/XYZ987"
    }],
    "signature"           => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a bill created notification$/) do
  # Sample payload from gocardless
  payload                 = {
    "resource_type"       => "bill",
    "action"              => "created",
    "bills"               => [{
      "id"                => "XYZ987",
      "status"            => "created",
      "source_type"       => "subscription",
      "source_id"         => "ABC123",
      "amount"            => "6.0",
      "amount_minus_fees" => "5.8",
      "uri"               => "https://gocardless.com/api/v1/bills/XYZ987"
    }],
    "signature"           => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end

When(/^GoCardless sends a bill retried notification$/) do
  # Sample payload from gocardless
  payload                 = {
    "resource_type"       => "bill",
    "action"              => "retried",
    "bills"               => [{
      "id"                => "XYZ987",
      "status"            => "retried",
      "source_type"       => "subscription",
      "source_id"         => "ABC123",
      "amount"            => "6.0",
      "amount_minus_fees" => "5.8",
      "paid_at"           => "2013-08-10T12:00:00Z",
      "uri"               => "https://gocardless.com/api/v1/bills/XYZ987"
    }],
    "signature"           => "f6b9e6cd8eef30c444da48370e646839c9bb9e1cf10ea16164d5cf93a50231eb"
  }
  # Set up stub for checking signature
  GoCardless.client.should_receive(:signature_valid?).once.and_return(true)
  # Post data
  post gocardless_webhook_path, payload: payload
end