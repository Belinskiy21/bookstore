require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)


module Bookstore
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework :rspec
    end
    
  end
end
