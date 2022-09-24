source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2.3', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'

gem 'pg'
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

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
end 

group :production do 
	gem 'pg'
	gem 'rails_12factor', '~> 0.0.3'
end
