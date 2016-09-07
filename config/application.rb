require File.expand_path('../boot', __FILE__)
require 'yaml'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Druify
  class Application < Rails::Application

    config.serve_static_assets = true

    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.time_zone = 'Central Time (US & Canada)'

    yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'application.yml'))).result)
    APP_CONFIG = HashWithIndifferentAccess.new(yaml_data)

    Instagram.configure do |config|
      config.client_id = APP_CONFIG[:instagram][:client_id]
      config.client_secret = APP_CONFIG[:instagram][:client_secret]
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
