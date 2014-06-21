source 'https://ruby.taobao.org/'

gem 'rails', '3.2.2.rc1'

gem 'execjs'

gem 'therubyracer', :platform => :ruby

gem 'carrierwave'

gem "heroku"

gem 'haml-rails', '>= 0.3.4'

gem 'simple_form', '~> 2.0.0'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

gem "twitter-bootstrap-rails", '~> 2.0.3'

gem 'sqlite3'

gem 'RedCloth'

gem "mongoid", "~> 3.0.0"

gem 'json'

gem 'resque',                         '~> 1.23.0', require: 'resque/server'

gem 'resque-scheduler',               :require => 'resque_scheduler'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'uglifier', '>= 1.0.3'
end

group :development do
	gem 'colored'
	gem 'pry-rails'
	gem 'pry-coolline'
  gem 'awesome_print'
end

group :development, :test do
	gem 'rspec-rails',				'~>2.12.0'
  gem 'factory_girl_rails', '~>4.1.0'
end

group :test do
  gem 'faker', 			'~>1.1.2'
  gem 'capybara', 	'~>2.0.1'
  gem 'guard-rspec','~>2.3.1'
  gem 'launchy',		'~>2.1.0'
  gem "shoulda-matchers"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
