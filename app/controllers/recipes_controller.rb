class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = current_user.recipes
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe successfully saved !'
    else
      render :new
    end
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end
  
  def show
    @recipe = current_user.recipes.find(params[:id])
  end
  
  def update
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path, notice: 'Recipe successfully updated !'
    else
      render :edit
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, alert: 'Recipe successfully deleted !'
    else
      render :show
    end
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.

  def recipe_params
    params.require(:recipe).permit(:name, :content, :recipe_photo)
  end

end
