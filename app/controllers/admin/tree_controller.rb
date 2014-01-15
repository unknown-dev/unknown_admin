module Admin
	class TreeController < ResourcesController
		custom_actions :resource => [:move_higher,:move_lower]
		helper_method :default_order
		def move_higher
      move_higher!{resource.move_higher}
    end

    def move_lower
      move_lower!{resource.move_lower}
    end

		respond_to :html,:js
		protected
      #### only get rootnodes
      def collection
        get_collection_ivar || set_collection_ivar(end_of_association_chain.root_folders)
      end
      def default_order
      	:id
      end
	end
end
