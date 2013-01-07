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
          copy_file "admin.css", "app/views/layouts/admin/application.html.erb"
        end

      end
    end
      
  end
end