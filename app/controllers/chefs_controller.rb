class ChefsController < ApplicationController
    def new
        @c = Chef.new
    end

    def create
        @c = Chef.new(chef_params)
        if @c.save
            session[:chef_id] = @c.id 
            flash[:success] = "Chef details are saved"
  

        else
            render 'new'
        end
    end 

    def show
        @c = Chef.find(params[:id])
        
    end 

    def edit
        @c = Chef.find(params[:id])
    end

    def update
        @c = Chef.find(params[:id])
        if @c.update(chef_params)
            flash[:success] = "Your account is updated successfully"
            redirect_to chef_path(@c)

        else
            render 'edit'
        end 
    end 

    def index
        @c = Chef.paginate(page: params[:page], per_page: 2)
    end

    def destroy
        @c = Chef.find(params[:id])
        @c.destroy
        flash[:success] = "chef is destroyed alongwith recipes"
        redirect_to chefs_path
    end
    
    private 

    def chef_params
        params.require(:chef).permit(:name, :email, :password, :password_confirmation)
    end 
end