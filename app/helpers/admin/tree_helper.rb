module Admin
	module TreeHelper
		def nested_nodes(nodes)
      nodes.map do |node, sub_nodes|
        content_tag(:div,:class=>"nested_nodes media")  do 
          nested = content_tag(:i,"",:class=>"pull-left icon-folder-open")
          nested << content_tag(:div, :class=>"media-body")  do
            render(partial:"tree_node",locals:{node:node})+nested_nodes(sub_nodes)
          end
          nested
        end
      end.join.html_safe
    end
	end
end