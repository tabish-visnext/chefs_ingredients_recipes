class SessionsController < ApplicationController
    def new
    end

    def create 
        c = Chef.find_by(email: params[:session][:email].downcase)
        if c && c.authenticate(params[:session][:password])
            session[:chef_id] = c.id
            flash[:success] = "Successful login"
            redirect_to c
        else
            flash.now[:danger] = "Not a successful login"
            render 'new'
        end 
    end

    def destroy
        session[:chef_id] = nil
        flash[:success]= "logout successful"
        redirect_to root_path
    end
end