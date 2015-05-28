source 'https://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '4.0.0'
gem 'rails-api' #Rails on API mode

gem 'warden', '1.2.3'
gem 'devise', '~> 3.0.0.rc'
gem 'cancan' #For authorization
gem 'active_model_serializers'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', '~> 1.6.6', group: [:development, :test]

#Testing
gem "rspec-rails", :group => [:development, :test] #Unit test framework
gem "database_cleaner", :group => :test #For cleaning database during unit tests
gem "cucumber-rails", :group => :test, :require => false #Behaviour driven development
gem "factory_girl_rails", :group => [:development, :test] #Factory for DB data
gem "shoulda-matchers", :group => :test #Collection of Rails testing matchers
gem 'cucumber-api-steps', :require => false, :group => :test #Cucumber steps for API
gem 'json_spec', group: :test # JSON matchers for tests
gem 'mongoid', '~> 4.0.0', github: "mongoid/mongoid"
gem 'bson_ext'
gem 'rack-cors', :require => 'rack/cors'
gem 'mongoid-autoinc'
gem 'devise_header_token'