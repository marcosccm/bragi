require File.expand_path('../boot', __FILE__)
require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Bragi
  class Application < Rails::Application
    config.i18n.default_locale = :ptBr
    config.i18n.enforce_available_locales = false
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
  end
end
