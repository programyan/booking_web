source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'figaro'
gem 'draper'

gem 'micromachine'
gem "reform"
gem "reform-rails"
gem 'trailblazer', '1.1.2'
gem 'trailblazer-rails', '0.4.0'

gem 'multi_json'
gem 'oj'
gem 'representable'
gem 'responders'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# documentation
gem 'apitome', git: 'git@github.com:jejacks0n/apitome.git', branch: 'master'

# services
gem 'mailgun_rails'
gem 'redis', '~> 3.0'
gem "sentry-raven"
gem 'sidekiq'

# Emails
gem 'inky-rb', require: 'inky'
# Stylesheet inlining for email **
gem 'premailer-rails'

# React
gem "react_on_rails", "10.0.0"
gem "webpacker", "~> 3.0"
gem 'mini_racer', platforms: :ruby

# Auth
gem 'devise', '~> 4.4.0'

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'faker-russian'
  gem 'guard', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'rails-controller-testing'
  gem 'rspec-mocks'
  gem 'rspec-rails', '~> 3.0'
  gem 'rspec_api_documentation'
  gem 'selenium-webdriver'
  gem 'webmock'
end

group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rake'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano3-puma', '~> 3.1'
  gem 'capistrano-yarn', require: false
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
