
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'devise'
require 'capybara/webkit'

ActiveRecord::Migration.maintain_test_schema!
REQUIRED_DIRS = %w[
  support
]

REQUIRED_DIRS.each do |path|
  Dir[Rails.root.join("spec/#{path}/**/*.rb")].each { |f| require f }
end

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Features::SessionHelpers, type: :feature

end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
