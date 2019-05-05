require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require 'active_job/railtie'
require "active_record/railtie"
# require 'active_storage/engine'
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Inspections
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom
    config.time_zone = 'Stockholm'

    config.i18n.load_path += Dir[Rails.root.join('config',
                                                 'locales',
                                                 '**',
                                                 '*.{rb,yml}')]
    config.i18n.default_locale = :sv

    config.generators do |g|
      g.assets false
      g.helper false
      g.model_specs false
      g.controller_specs false
      g.view_specs false
      g.helper_specs false
      g.stylesheets false
      g.scaffold_stylesheet false
      g.jbuilder false
      g.system_tests false
      g.routing_specs false
    end

    config.x.app_url = ENV.fetch('APP_URL') { 'kontrollansvarig.se' }
  end
end
