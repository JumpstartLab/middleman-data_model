module Middleman
  module DataModel

    class SimpleDataModel

      def self.all
        @data.map {|item| new item }
      end

      def self.data_name
        @data_name ? @data_name : self.to_s.downcase.pluralize
      end

      def self.data=(data)
        @data = data
      end

      def self.inherited(base)
        models << base
      end

      def self.models
        @models ||= []
      end


      def initialize(params = {})
        params.each do |key,value|
          instance_variable_set("@#{key}",value)

          next if respond_to? key

          self.class.send :define_method, key do
            instance_variable_get("@#{key}")
          end
        end
      end
    end

  end
end