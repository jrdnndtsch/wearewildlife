source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record


gem 'instagram'
gem 'twitter'
gem 'rails_autolink'
gem 'rinku'

gem "autoprefixer-rails"

#for sass
gem 'bourbon'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#for oauth1 requests
gem 'oauth1'
gem 'oauth'

gem 'omniauth'
gem 'json'

#to build breadcrumbs
gem "breadcrumbs_on_rails"

#for cron jobs
gem 'whenever', '~> 0.9.4', :require => false

#for more fun HTTP requests
# gem 'httparty'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

#for user authentication
gem 'devise'

#for image uploads
gem 'paperclip'
gem 'aws-sdk-v1'
gem 'aws-s3'

#for change tracking
gem 'paper_trail'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rack-mini-profiler', require: false
gem 'rubocop', require: false


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'better_errors'

  gem 'quiet_assets'

  # optimization
  gem 'bullet'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

