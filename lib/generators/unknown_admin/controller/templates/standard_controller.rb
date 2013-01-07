module Admin
  class <%= klass_name %>Controller < ResourcesController



    private 
      def <%=model_name%>_params
        
        params.require(:<%=model_name%>).permit(<%= columns.join(",") %>)
      end
  end
end
