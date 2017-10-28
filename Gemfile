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
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
  gem "spring-commands-rspec"
end
group :development, :test do
  gem 'rspec-rails'
  gem 'ffaker'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end

group :test do
  gem 'spring'
  gem 'capybara', '~> 2.13'
  gem 'transactional_capybara', '0.2.0'
  gem 'database_cleaner'
  gem 'faker'
  gem 'email_spec'
  gem 'action_mailer_cache_delivery'
  gem 'simplecov', :require => false
end

gem 'rails_12factor', group: :production

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
