require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Blog
  class Application < Rails::Application
    config.generators do |g|
      g.view_specs false
      g.helpers_specs false
    end    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/app/decorators)
    config.autoload_paths += Dir["#{config.root}/lib", "#{config.root}/lib/**/"]
    config.encoding = "utf-8"

    config.filter_parameters += [:password]
    config.active_record.whitelist_attributes = true

    config.assets.enabled = true
    config.assets.precompile += ["*.js", "*.css"]

    config.assets.version = '1.0'

    config.assets.initialize_on_precompile = false
  end
end
