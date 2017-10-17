source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml'
gem 'rails-i18n'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'bootstrap-sass'
gem 'cancancan'
gem 'autoprefixer-rails'
gem 'activeadmin', github: 'activeadmin'
gem 'active_admin_importable'
gem 'kaminari'
gem 'carrierwave', '~> 1.0'
gem 'cloudinary'
gem 'aasm'
gem "mini_magick"
gem 'jquery-rails', '~> 4.3.1'
gem 'draper'
gem 'wicked'
gem 'simple_form'
gem 'country_select'
gem 'virtus'


group :development do
  gem 'pry'
  gem 'selenium-webdriver'
  gem 'foreman'
  gem 'dotenv-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
  gem 'ffaker'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 2.13'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
end

gem 'rails_12factor', group: :production

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
