require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CrmGemini
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets', 'custom')
    config.assets.paths << Rails.root.join('assets', 'images', 'patterns')
    config.assets.paths << Rails.root.join('public')
    
    config.active_record.raise_in_transactional_callbacks = true

    config.active_job.queue_adapter = :delayed_job

    config.i18n.default_locale = :'sk'
    config.time_zone = 'Bratislava'
  end
end
