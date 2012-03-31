source 'http://rubygems.org'

gem 'rails', '3.2.0'
gem 'jquery-rails'
gem 'mime-types', '1.17.2'
gem 'will_paginate', '~> 3.0'
gem 'alphabar'

# Database
gem 'pg'

# Server
gem 'thin'

# Search
gem 'pg_search'

group :production do
  gem "pg"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '1.2.3'
  gem 'rspec-rails'
  gem 'webrat'
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
  gem 'pg'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec'
  gem 'webrat'
  gem 'pg'
end
