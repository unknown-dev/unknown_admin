module Admin
  class <%= klass_name %>Controller < ResourcesController



    private 
      def <%=model_name%>_params
        
        params.require(:<%=model_name%>).permit(<%= column_names.join(",") %>)
      end
  end
end
