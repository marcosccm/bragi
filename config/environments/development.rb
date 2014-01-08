Bragi::Application.configure do
  config.cache_classes = false
  config.eager_load = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.assets.debug = true

  ENV['posts_path'] = File.expand_path("../../../public/posts", __FILE__)
end

