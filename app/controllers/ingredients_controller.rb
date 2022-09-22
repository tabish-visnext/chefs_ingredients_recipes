class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :update, :show]

    def show 
        @ingredient_recipes = @i.recipes.paginate(page: params[:page], per_page: 2)
    end

    def index
        @i = Ingredient.paginate(page: params[:page], per_page: 2)
        
    end

    def edit
    end

    def new
        @i= Ingredient.new
    end

    private

    def set_ingredient
        @i = Ingredient.find(params[:id])
    end

    def create
        
    end
end