module Middleman
  module DataModel

    class SimpleDataModel < OpenStruct
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
    end

  end
end