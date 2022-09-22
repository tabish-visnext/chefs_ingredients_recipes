class ApplicationController < ActionController::Base


    def current_chef
        @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
    end

    def logged_in?
        !!current_chef
    end 

    def require_user
        if !logged_in?
            flash[:danger] = "you must be logged in to perform action"
            redirect_to root_path
        end
    end

end
