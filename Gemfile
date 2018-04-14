source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg', '~> 0.21.0'
gem 'puma'
gem 'devise'
gem 'config'
gem "rspec"
gem 'rspec-rails'
gem "factory_bot"
gem 'bcrypt'
gem 'mailgun-ruby'
gem 'bootstrap'
gem 'bootswatch'
gem 'haml'
gem 'haml-rails'
gem 'omniauth'
gem 'rb-readline'
gem "select2-rails"
gem 'will_paginate'
gem 'jquery-datatables-rails'
gem 'ajax-datatables-rails'
gem 'faker'
gem 'clearbit'
gem 'news-api'
gem 'omniauth-facebook'
gem 'gmaps4rails'

gem 'sass-rails'
gem 'sprockets-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'textacular'
gem 'pry'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]