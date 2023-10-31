source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"
gem "rails", "~> 6.0"

gem "bootsnap"
gem "clearance" # Authentication
gem "font-awesome-sass"
gem "mini_magick"
gem "pg"
gem "puma", "~> 6.4"
gem "sass-rails"
gem "simple_form"
gem "textacular", "~> 5.6"
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "bullet"
  gem "capybara", "~> 3.39"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "selenium-webdriver"
end

group :development do
  gem "foreman"
  gem "standardrb"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
