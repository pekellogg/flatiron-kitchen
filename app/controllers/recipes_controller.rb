class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update]
    before_action :ingredients_all, only: [:new, :edit]

    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if recipe_params && !recipe_params.empty?
            @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end

    def index
        @recipes = Recipe.text_search(params[:query])
        render 'index'
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def ingredients_all
        @ingredients = Ingredient.all
    end

end  