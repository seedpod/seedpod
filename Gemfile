source 'https://rubygems.org'

ruby '2.0.0'
#ruby-gemset=seedpod

gem 'rake'
gem 'rails', '~> 4.0.0'
gem 'dotenv'
gem 'exception_notification'
gem 'kramdown'

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
  gem 'cucumber', '1.3.5'
  gem 'database_cleaner', '<= 1.0.1'
  gem 'vcr'
  gem 'launchy'
  gem 'coveralls'
  gem 'travis'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara-mechanize'
  gem 'timecop'
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
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'gocardless'
gem 'devise', '>= 3.1.0.rc2', '< 4.0.0'
gem 'rails_admin', github: 'davebrace/rails_admin', branch: 'use-static-bootstrap-2'
gem "high_voltage"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'