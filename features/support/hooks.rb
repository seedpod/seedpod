Before '@hostname' do
  Capybara.default_host = "http://seedpod.dev"
end

Around('@timecop') do |scenario, block|
  Timecop.freeze(DateTime.new(2013,8,9,22,56))
  block.call
  Timecop.return
end