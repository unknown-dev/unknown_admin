require 'rails/generators'

module UnknownAdmin
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a slim 'inherited-resources' controller"
      #argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'

      def create_controller

        template "standard_controller.rb", 'app/controller/admin/#{file_name}_controller.rb'


      end

      private
        def file_name
          name.underscore.pluralize
        end
        def model_name
          name.singularize.underscore
        end
        def model
          name.singularize.camelize.constantize
        end
        def klass_name
          name.camelize.pluralize
        end

        def columns
          model.column_names.map{|c| ":#{c}"}
        end
    end
      
  end
end