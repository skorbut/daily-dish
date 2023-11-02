# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'pundit'
gem 'devise'
gem 'webauthn'

gem 'bootsnap', require: false
gem 'font-awesome-sass'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pico-rails'
gem 'puma', '~> 6.0'
gem 'rails', '~> 7.1.1'
gem 'rails-i18n'
gem 'redcarpet'
gem 'redis', '~> 4.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'simplecov-json'
end

gem 'dockerfile-rails', '>= 1.5', group: :development

gem 'sentry-ruby', '~> 5.11'

gem 'sentry-rails', '~> 5.11'
