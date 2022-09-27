source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2.3', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'railties', '~> 5.0', '>= 5.0.0.1'
# gem 'sqlite3'

gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'tux'
gem 'rack-flash3'
gem "bcrypt"
gem 'sinatra-flash'

group :test do
  gem 'launchy'
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end

group :development do
  gem 'sqlite3'
end 

# gem 'sqlite3', :group => :development

group :production do 
	gem 'pg'
end
