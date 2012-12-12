module Admin
  module ResourcesHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end
    def is_active?(page)
      "active" if current_page?(page)
    end
    def is_scope?(controller)
      "active" if params[:controller]==controller
    end
    
    def change_info_for(item)
      if item.creator.present? or item.editor.present?
        render partial:"admin/shared/change_info",:locals=>{:item=>item}
      end
    end
      
    def render_user_tokens(users)
      render template:"admin/users/token_fields.json.rabl",:locals=>{:users=>users}
    end
    
    def form_actions(form,current)
      render :partial=>"admin/shared/form_actions",:locals=>{:f=>form,:theclass=>current.class}
    end


    def date_picker(f,object,object_name, options = {},&block)
      content_tag :div,class: "input-append date",data: {date: object.send(object_name), "date-format"=>"yyyy-mm-dd"} do
        input= f.text_field(object_name, options = {})
        span = content_tag :span,class:"add-on" do
          content_tag :i,"", class:"icon-th icon-white"
        end
        input+span
      end
    end



    


  end
end