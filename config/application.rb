require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Polapine
  class Application < Rails::Application
    config.load_defaults 5.2
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => 'http://localhost:8080',
      'Access-Control-Request-Method' => %w{GET POST PATCH OPTIONS}.join(",")
    }
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          headers: :any,
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: [:get, :post, :options, :delete, :put]
      end
    end

    config.to_prepare do
      DeviseController.respond_to :html, :js
    end

  end
end