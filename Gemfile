source 'https://rubygems.org'
ruby '2.3.1'
# gem 'autoprefixer-rails', '7.1.2.1'
# ---------------------------------------------------------------------------------------
# BOOTSTRAP
# ---------------------------------------------------------------------------------------
# Add the SASS version of Bootstrap for styling
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-sass', '~> 3'
# ---------------------------------------------------------------------------------------
# WYSIWIG editor for bootstrap
gem 'bootstrap-wysihtml5-rails'
gem 'bourbon'
# Provides authentication for users
gem 'cancancan'
# A JS Graphing library
gem 'chartkick'
# Coffee is a better version of Javascript that transcompiles to JS
gem 'coffee-rails', '~> 4.1.0'
# Provides user login and authentication functions
gem 'devise'
# Additional fonts
gem 'font-awesome-rails'
# Replace ERB with a better templating language
gem 'haml-rails'
# Adds a DSL for building JSON objects
gem 'jbuilder', '~> 2.0'
# Include jQuery via the Rails asset pipeline
gem 'jquery-rails'
# Mailboxer provides in-app notifications and messages
gem 'mailboxer'
# Add ability to have multiple output log files, such as log/audit.log
gem 'multi_logger'
gem 'nested_form'
# Passenger is the application server that will run Rails
# gem 'passenger', require: 'phusion_passenger/rack_handler' # This require will execute passenger start on rails server
# For rendering a pdf
gem 'prawn'
# For rendering a table inside the pdf
gem 'prawn-table'
# The core Rails gem
gem 'puma'
gem 'rails', '5.0.4'
# For running rake tasks, and scripting against the app
gem 'rake'
# For rendering dynamic images in SVG
gem 'rasem'
# For rendering remote assets (http://www.aljex.com/news) as a partial
gem 'remote_partial'
# SASS is syntactically awesome stylesheets, a CSS replacement
gem 'sass-rails', '~> 5.0'
# Select2 replacement for select boxes
gem 'select2-rails'
gem 'sqlite3'
# This provides a JS engine that allows us to compile assets
gem 'therubyracer'
# Turbolinks allows you to build a multi-page app but have it load pages as if it were single-page
gem 'turbolinks'
# Uglifier mimimizes JS assets in production
gem 'uglifier', '>= 1.3.0'
group :development do
  # Prints out data outputs nicely
  gem 'awesome_print'
  # Spits out an interactive web page in development
  gem 'better_errors'
  # ---------------------------------------------------------------------------------------
  # CAPISTRANO
  # ---------------------------------------------------------------------------------------
  # Capistrano is a build tool that allows us to deploy with cap [env] deploy
  gem 'capistrano'
  # Capistrano specific tasks and hooks
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano3-delayed-job'
  # Manual complexity calculator. use: flog -d filename
  gem 'flog'
  # A tool to convert HTML to HAML
  gem 'html2haml'
  # Makes web requests not log an obnoxious amount to the console
  # gem 'quiet_assets'
  # Generates some base layout templates for styles and such. Can probably be removed now
  gem 'rails_layout'
  # ---------------------------------------------------------------------------------------
  # ---------------------------------------------------------------------------------------
  # SPRING
  # ---------------------------------------------------------------------------------------
  # Spring loader speeds up execution time of subsequent rake and rails commands
  gem 'spring'
  # Spring binstubs allow some commands to run faster with pre-caching a Rails env
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
  # ---------------------------------------------------------------------------------------
  # Allows you to just drop 'console' into a view to interactively debug a web request
  gem 'web-console', '~> 2.0'
end
group :development, :test do
  # For debugging from the command line, for instance, specs
  gem 'byebug'
  # Business-driven development using Cucumber
  gem 'cucumber-rails', require: false
  # For simplifying factories in tests
  gem 'factory_girl_rails'
  # Provides a bunch of canned mock objects
  gem 'faker'
  # Replace the rails console with Pry, which is easier to use
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-rescue'
  # For unit testing
  gem 'rspec-rails'
  # Add code style standards checking
  gem 'rubocop'
end
group :test do
  # Integration testing
  gem 'capybara'
  # Clears the database between integration tests
  gem 'database_cleaner'
  # Used for capybara's save_and_open_page method
  gem 'launchy'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  # Use headless webkit for a full javascript implementation in integration tests
  gem 'poltergeist'
  # Used to communicate with a live browser window
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end
