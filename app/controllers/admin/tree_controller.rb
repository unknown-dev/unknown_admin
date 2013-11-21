module Admin
	class TreeController < ResourcesController

		respond_to :html,:js
		protected
      #### only get rootnodes
      def collection
        get_collection_ivar || set_collection_ivar(end_of_association_chain.root_folders)
      end
	end
end
