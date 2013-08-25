source 'http://rubygems.org'

gem 'rails', '3.2.11'
gem 'jquery-rails', "2.3.0"

gem 'mime-types', '1.17.2'

gem "activeadmin"
gem 'cancan'

gem "rails-i18n"

gem "active_model_serializers"
gem 'figaro'

gem 'stripe'

# Database
gem 'pg'

# Server
gem 'thin'
gem 'rack-cors', :require => 'rack/cors'

# Search
gem 'pg_search'


group :production do
  gem "pg"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem "haml-rails"
  gem "bootstrap-sass-rails"
  gem 'uglifier', '1.2.3'
  gem 'rspec-rails'
  gem 'webrat'
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec'
  gem 'webrat'
  gem 'pg'
end
