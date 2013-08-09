require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir     = 'features/cassettes'
  c.default_cassette_options = { :record => :once, :match_requests_on => [:method, :host, :path] }
  c.ignore_localhost         = true
  c.ignore_hosts               'getseedpod.com'
  # Filter out secure variables
  [
    'GOCARDLESS_APP_ID',
    'GOCARDLESS_APP_SECRET',
    'GOCARDLESS_APP_TOKEN',
    'GOCARDLESS_APP_MERCHANT',
  ].each do |var|
    c.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end

VCR.cucumber_tags do |t|
  t.tag  '@vcr', :use_scenario_name => true
end