module Admin
  class <%= klass_name %>Controller < ResourcesController



    private 
      def permitted_params
        
        params.permit(<%=model_name%>:[<%= (columns-[":id",":created_at",":updated_at"]).join(",") %>])
        #or permit everything
        #params.permit!
      end
  end
end
