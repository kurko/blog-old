source 'https://rubygems.org'

gem 'rails', '~>4'

# rails 4 compatibility
  gem 'protected_attributes'
  gem 'activerecord-deprecated_finders'

# Database
  gem 'sqlite3'
  gem 'mysql2'


# Components for forms and widgets
  gem "devise"
  gem "simple_form"

# Presenters and objects for simplifying internal workflows
  gem "draper"
  gem "redcarpet"

# Assets and client stuff
  # Asset building
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer', "0.11.4"
  gem 'uglifier'

  # View
  gem "active_model_serializers"

  # Libs
  gem 'jquery-rails'
  gem 'ember-rails'
  gem 'ember-source', '1.0.0.rc7'

# Deploying
gem 'capistrano'

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller', '0.7.2'
end

group :development, :test do
  gem "rspec-rails"
  gem "capybara"
end

group :test do
  gem "capybara-webkit"
  gem "launchy"
  gem "factory_girl_rails"
  gem "database_cleaner", "1.0.1"
end
