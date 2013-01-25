require "middleman-data_model/version"
require 'ostruct'
require 'middleman-data_model/simple_data_model'

module Middleman
  module DataModel
    extend self

    def registered(app, options_hash = {})
      options_hash = default_options.merge options_hash

      require_models(options_hash[:model_dir])
      load_models_with_app_data_hook(app)
    end

    def default_options
      { model_dir: "data" }
    end

    def require_models(path)
      model_paths(path).each {|file| require file }
    end

    def model_paths(path)
      Dir["#{path}/**/*.rb"]
    end

    def load_models_with_app_data_hook(app)
      app.before do
        SimpleDataModel.models.each do |model|
          model.data = data.send(model.data_name)
        end
      end
    end

    def included ; registered ; end

    ::Middleman::Extensions.register(:data_models,DataModel)

  end
end
