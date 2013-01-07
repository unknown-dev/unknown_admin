require 'rails/generators'

module UnknownAdmin
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Admin Asset Pipeline"
      argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'

      def add_assets

        unless File.exist?('app/assets/javascripts/admin/admin.js')
          copy_file "admin.js", "app/assets/javascripts/admin/admin.js"
        end

        unless File.exist?('app/assets/stylesheets/admin/admin.css')
          copy_file "admin.css", "app/assets/stylesheets/admin/admin.css"
        end

        unless File.exist?('app/views/layouts/admin/application.html.erb')
          copy_file "application.html.erb", "app/views/layouts/admin/application.html.erb"
        end

        unless File.exist?('app/controllers/admin/admin_controller.rb')
          copy_file "admin_controller.rb", "app/controllers/admin/admin_controller.rb"
        end

        unless File.exist?('app/controllers/admin/resources_controller.rb')
          copy_file "resources_controller.rb", "app/controllers/admin/resources_controller.rb"
        end
      end
    end
      
  end
end