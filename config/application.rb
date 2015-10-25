require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Travelshopper
  class Application < Rails::Application
    # config.time_zone = 'Central Time (US & Canada)'

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.test_framework :rspec, view_specs: false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end
  end
end
