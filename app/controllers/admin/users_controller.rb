module Admin
  class UsersController < ResourcesController
    helper_method :default_fields
    #crudify :user,:paginate => true
    
    respond_to :html
    
    def list_fields
      [:id, :email, :first_name, :last_name]
    end

    def search_fields
      [:email_cont]
    end

    def default_fields(model)
      fields= []
      fields[:user]=[:user_id, :login_id]
    end
    
   


    # GET /users/1/render/:partial
    def partial
      @user = User.find(params[:id])
      render :partial=>params[:partial]
    end
    
    


    
    
    
    private
    
    def pre_select_users
      if current_domain.nil?
        @users = User
      else
        @users = current_domain.users.master
      end
    end
    
    
  
    
    
    
  end
end