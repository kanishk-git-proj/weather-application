require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WeatherForecastApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # Allow requests from the frontend's origin
        origins 'http://localhost:3001' # Adjust this to match your frontend's origin

        # Allow specific resource patterns, headers, and HTTP methods
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :delete, :options, :head],
                 credentials: false # Set to true if using authentication requiring cookies
      end
    end
    config.api_only = true
  end
end
