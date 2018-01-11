source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.7'
gem 'acts_as_list', '~> 0.9.10'
gem 'cancancan', '~> 2.1', '>= 2.1.2'
gem 'devise_token_auth', '~> 0.1.42'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'rack-cors', '~> 1.0', '>= 1.0.2', require: 'rack/cors'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'faker', '~> 1.8', '>= 1.8.5'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end
