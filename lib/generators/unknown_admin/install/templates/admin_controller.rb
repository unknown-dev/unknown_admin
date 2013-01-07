module Admin
  class AdminController < ActionController::Base

    #before_filter :authenticate_user!
    protect_from_forgery
  
    layout :ajax_request
    #before_filter :authorize
  
    #delegate :allow?, to: :current_permission
    helper_method :allow?
    
    #delegate :allow_param?, to: :current_permission
    #helper_method :allow_param?
    
    
    #helper_method :current_domain
    helper_method :current_style

    

    private
      def ajax_request
        
        request.xhr? ? "admin/ajax" : "admin/application"
        
        
      end

      ## TODO: Fix this
      def allow?(*args)
        true
      end
      
      def current_domain
        @current_domain ||= Domain.find(session[:current_domain_id]) unless session[:current_domain_id].nil?
      end
      def current_style
        color = "#fff"
        
        templ=Tilt::ERBTemplate.new { "body { background-color:<%=color%>}" }
        return templ.render(self,:color=>color)
      end
      
      def current_permission
        @current_permission ||= Permissions.permission_for(current_user)
      end
    
      def current_resource
        nil
      end
    
      def authorize
        User.current=current_user
        if current_permission.allow?(params[:controller], params[:action], current_resource)
          current_permission.permit_params! params
        else
          render :text=> "Not authorized.",:status=>:unauthorized
        end
      end
      
  end
end