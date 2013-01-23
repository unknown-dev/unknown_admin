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

      def collection
        @search = end_of_association_chain.search(params[:q])
        get_collection_ivar || set_collection_ivar(@search.result.paginate(:page => params[:page], :per_page => per_page))
      end
     
      def per_page
        10
      end

  end
end