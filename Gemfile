source 'https://rubygems.org'

gem 'rails', '4.2.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'rails-i18n'

#upload
gem 'carrierwave'

#date-picker
gem 'bootstrap-datepicker-rails'

#jquery on refresh
gem 'jquery-turbolinks'

#upload remote true
gem 'remotipart', '~> 1.2'

# Resque
gem 'resque', require: 'resque/server'
gem 'resque-scheduler', require: 'resque/scheduler/server'
gem 'hiredis'

# DB backup
gem 'backup'


group :development, :test do
  gem 'sqlite3'
  gem 'rubysl-pty', :platforms => :ruby
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "capistrano", "~> 3.6"
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'
end

gem 'pry-rails', :group => :development

group :production do
  gem 'mysql2', '~> 0.3.18'
end