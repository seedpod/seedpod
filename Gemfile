source 'https://rubygems.org'

ruby '2.0.0'
#ruby-gemset=seedpod

gem 'rake'
gem 'rails', '~> 4.0.0'
gem 'dotenv'
gem 'exception_notification'
gem 'kramdown'
gem 'activemerchant'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'cucumber'
  gem 'database_cleaner', '< 1.1.0' # pinned awaiting fix for https://github.com/bmabey/database_cleaner/issues/224
  gem 'vcr'
  gem 'launchy'
  gem 'coveralls'
  gem 'travis'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara-mechanize'
  gem 'timecop'
  gem 'email_spec'
  gem 'pry'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'letter_opener'
end

group :test do
  gem 'webmock'
end

# Gems required for Heroku
group :production do
  gem 'rails_12factor'
  gem 'pg'
end

gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.0.2'
gem 'gocardless'
gem 'devise', '~> 3.1.0'
gem 'rails_admin'
gem "high_voltage"
gem 'rack-google-analytics'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'