class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    for i in (0..9) do
      @recipe.ingredients.build(ingredient_type: "#{i}")
    end


  end

  def create
    #byebug
    @recipe = Recipe.create(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
