require 'rails'

module Repertoire
  module Assets
    class Railtie < Rails::Railtie
      config.repertoire_assets = ActiveSupport::OrderedOptions.new
      
      initializer "repertoire_assets" do
        config.app_middleware.use Repertoire::Assets::Processor, config.repertoire_assets, Rails.logger
      end
      
      rake_tasks do
        dir = Pathname(__FILE__).dirname.expand_path
        load dir + "tasks.rake"
      end
    end
  end
end