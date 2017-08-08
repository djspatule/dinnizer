class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end
  def index
    @recipes = Recipe.all
  end
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
           redirect_to recipes_path
        else
            render :new
        end
  end

  def edit
    @recipe = Recipe.find(params[:id].to_i)
  end
  def show
    @recipe = Recipe.find(params[:id].to_i)
  end
  def update
    @recipe = Recipe.find(params[:id].to_i)
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end

  end
  def destroy
    Recipe.destroy(params[:id].to_i)
    redirect_to recipes_path
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def recipe_params
    params.require(:recipe).permit(:name, :content)
  end

end

