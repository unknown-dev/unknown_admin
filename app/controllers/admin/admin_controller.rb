module Admin
  class AdminController < ActionController::Base


    protect_from_forgery
    helper_method :allow?
    layout :ajax_request

    

    private
      def ajax_request
        request.xhr? ? "admin/ajax" : "admin/application"    
      end

      ### TODO: Add your Authentication method here!
      def allow?(*args)
        true
      end

  end
end