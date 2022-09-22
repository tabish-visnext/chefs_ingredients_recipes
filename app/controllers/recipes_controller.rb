class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        @rec = Recipe.paginate(page: params[:page], per_page: 2)
    end

    def show 
        @rec = Recipe.find(params[:id])
    end
 
    def new 
        @rec = Recipe.new
    end

    def create
        @rec = Recipe.new(recipe_params)
        @rec.chef = Chef.first
        if @rec.save
            flash[:success] = "recipe save successfully"
            redirect_to recipe_path(@rec)
    
        else 
            render 'new'
        end  
    end 

    def edit
        @rec = Recipe.find(params[:id])
    end

    def update
        @rec = Recipe.find(params[:id])
        if @rec.update(recipe_params)
            flash[:success] = "recipe is updated successfully"
            redirect_to recipe_path(@rec)

        else
            render 'edit'
        end 
    end

    def destroy
        Recipe.find(params[:id]).destroy
        flash[:success] = "deleted sucessfully"

    end

    private
 
    def set_recipe
        @r = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description)
        redirect_to recipes_path
    end

    def require_same_user
        if current_chef != @r.chef and !current_chef.adm?
            flash[:danger] = "you can edit or delete your own recipes"
            redirect_to recipes_path
        end 
    end
end 

