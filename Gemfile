source 'https://rubygems.org'

gem 'rails',        '5.1.2'     # The rails
gem 'puma',         '3.9.1'     # The dev server
gem 'sass-rails',   '5.0.6'     # Supports SCSS
gem 'uglifier',     '3.2.0'     # Javascript stuff
gem 'coffee-rails', '4.2.2'     # same
gem 'jquery-rails', '4.3.1'     # same
gem 'turbolinks',   '5.0.1'     # Faster loading pages
gem 'jbuilder',     '2.7.0'     # Easily builds JSON objects


group :development, :test do
  gem 'sqlite3',  '1.3.13'
  # Call 'byebug' anywhere in code to stop execution and get a debugger console
  gem 'byebug',  '9.0.6', platform: :mri
end

group :development do
  # Access an IRB console on exception pages 
  # or by using <%= console %> anywhere in the code.
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.0.8'
  # Run shit faster in dev
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
