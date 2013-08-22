require 'inherited_resources'
module Admin
  class ResourcesController < AdminController

    inherit_resources


    helper_method :list_fields
    def list_fields
      resource_class.column_names
    end
    
    helper_method :show_fields
    def show_fields
      (resource_class.column_names-["id","created_by","updated_by","created_at","updated_at"])
    end

    helper_method :search_fields
    def search_fields
      []
    end


    def create
      create! { collection_path }
    end
    def update
      update! { collection_path }
    end


    protected
      # This method is responsable for building the object on :new and :create
      # methods. If you overwrite it, don't forget to cache the result in an
      # instance variable.
      #
      def build_resource
        logger.debug "---------build info-----------"
        logger.debug "Build Method: #{method_for_build}"
        logger.debug "End of assoc: #{end_of_association_chain}"
        logger.debug ""
        get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_build, *resource_params))
      end
      def resource_params
        return [] if request.get?
        whitelist_method = :"#{ resource_request_name }_params"
        [ self.send(whitelist_method) ]
      end
      def collection
        @search = end_of_association_chain.search(params[:q])
        get_collection_ivar || set_collection_ivar(@search.result.paginate(:page => params[:page], :per_page => per_page))
      end
     
      def per_page
        10
      end

  end
end