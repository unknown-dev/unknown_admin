module Admin
  module ResourcesHelper
    def resolve_field(resource,list_field_item)
      resolved = list_field_item.class.to_s
      case list_field_item
      when Symbol,String
        val = resource.send(list_field_item)
        case val
        when ActiveSupport::TimeWithZone
          resolved =l(val,format: :long)
        else
          resolved = val
        end
      when Hash
        rel = resource.send(list_field_item.first.first)
        resolved = rel.send(list_field_item.first.last)
      end
      resolved
    end
    def resolve_field_name(list_field_item)
      case list_field_item
      when Symbol,String
        resource_class.human_attribute_name(list_field_item)
      when Hash
        resource_class.human_attribute_name(list_field_item.first.first)
      end
    end

    def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "btn btn-primary add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end


    
  end
end