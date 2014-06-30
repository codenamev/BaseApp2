source 'http://rubygems.org'

gem 'rails', '~> 4.1.1'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem "aasm"
gem 'capistrano'
gem 'capistrano-ext'
gem "configatron"
gem "declarative_authorization"
gem "delayed_job_active_record"
gem 'devise'
gem 'email_validator'
gem "fb_graph"
gem "gravatar_image_tag"
#gem "i18n_generators"
#gem "i18n_routing"
gem "jquery-rails"
gem "oauth2"
gem "omniauth"
gem 'omniauth-openid'
gem 'omniauth-facebook'
gem "polish"
gem "post_commit"
gem 'rack-timeout'
gem 'recipient_interceptor'
gem "simple_form"
gem "will_paginate"

group :development do
  # To use debugger
  # gem 'ruby-debug'
  # gem 'ruby-debug19' if you are using ruby 1.9.2 or higher
  gem 'foreman'
  gem "nifty-generators"
  gem 'spring'
  gem 'spring-commands-rspec'
  #gem 'sqlite3-ruby', :require => "sqlite3"
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.14.0'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock'
end
