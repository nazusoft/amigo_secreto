require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AmigoSecreto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local

    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :'pt-BR'

    config.active_job.queue_adapter = :sidekiq

  end
end
