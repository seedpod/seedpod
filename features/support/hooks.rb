Before '@hostname' do
  Capybara.default_host = "http://seedpod.dev"
end

After('@timecop') do
  Timecop.return
end