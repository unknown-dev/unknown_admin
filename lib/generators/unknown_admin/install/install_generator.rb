require 'rails/generators'

module UnknownAdmin
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Twitter Bootstrap to Admin Asset Pipeline"
      argument :stylesheets_type, :type => :string, :default => 'less', :banner => '*less or static'

      def add_assets

        unless File.exist?('app/assets/javascripts/admin/application.js')
          copy_file "application.js", "app/assets/javascripts/admin/application.js"
        end

        unless File.exist?('app/assets/stylesheets/admin/application.css')
          copy_file "application.css", "app/assets/stylesheets/admin/application.css"
        end

      end
    end
      
  end
end