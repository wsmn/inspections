source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
gem 'rails', '~> 5.1.3'

gem 'carrierwave'
gem 'carrierwave-aws'
gem 'clearance' # Authentication
gem 'dropbox_api'
gem 'font-awesome-rails'
gem 'mini_magick'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'skylight' # Monitoring
gem 'textacular', '~> 5.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker-react', '~> 0.3.1'
gem 'webpacker'

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'foreman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
