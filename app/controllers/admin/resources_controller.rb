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

    
    def list_sort
      params[:competition].each_with_index do |id, index|
        resource_class.update_all({position: index+1}, {id: id})
      end 
      render nothing:true
    end
    

    protected

      def collection
        if params[:rquery].nil?
          if end_of_association_chain.column_names.include? "position"
            params[:rquery] = {s:"position asc"}
          else
            params[:rquery] = {s:"id desc"}
          end
        end

        if params[:q].present? && search_query_field
          @search = end_of_association_chain.where("#{search_query_field} LIKE ?","#{params[:q]}%").search(params[:rquery])
        else
          @search = end_of_association_chain.search(params[:rquery])
        end

        unless params[:all_pages]
          get_collection_ivar || set_collection_ivar(@search.result.paginate(:page => params[:page], :per_page => per_page))
        else
          get_collection_ivar || set_collection_ivar(@search.result)
        end
      end
     
      def per_page
        10
      end

  end
end