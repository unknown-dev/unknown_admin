require 'rails/generators'

module UnknownAdmin
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a slim 'inherited-resources' controller"
      class_option  :skip_routes, :type => :boolean, :default => false,:desc=>"Skip adding resource/namespace to route file"
      #argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'

      def create_controller

        template "standard_controller.rb", "app/controllers/admin/#{file_name}_controller.rb"


      end

      def update_routes
        unless options.skip_routes
          line = "namespace :admin"
          
          unless File.read('config/routes.rb').match(/^\s*#{Regexp.escape(line)}/i)
            route_namespace "#{line} do  end"
          end
          route_into "resources :#{file_name}",:admin
        end
      end

      private
        def route_into(routing_code,namespace)
          log :route, routing_code
          line = "namespace :#{namespace.to_s} do"
          sentinel = /\s*#{Regexp.escape(line)}/mi

          in_root do
            inject_into_file 'config/routes.rb', "\n    #{routing_code}\n", { :after => sentinel, :verbose => false }
          end
        end
        def route_namespace(routing_code)
          log :route, routing_code
          sentinel = /\.routes\.draw do(?:\s*\|map\|)?\s*$/

          in_root do
            inject_into_file 'config/routes.rb', "\n  #{routing_code}\n", { :after => sentinel, :verbose => false }
          end
        end

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