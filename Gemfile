source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',        '~> 5.2.0'
gem 'mysql2',       '>= 0.4.4', '< 0.6.0'
gem 'puma',         '~> 4.3'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'

gem 'devise',           '~> 4.4'
gem 'materialize-sass', '~> 1.0.0'
gem 'material_icons',   '~> 2.2.1'
gem 'redis',            '~> 4.0'
gem 'sidekiq',          '~> 5.1.0'
gem 'inky-rb',          require: 'inky'
gem 'premailer-rails'
gem 'mini_racer'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "factory_bot_rails"
  gem "ffaker"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
