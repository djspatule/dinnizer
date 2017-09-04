class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :show, :update, :destroy]

  def new
    @recipe = Recipe.new
  end
  def index
    @recipes = Recipe.where(user: current_user)
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe successfully saved !'
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id].to_i)
  end
  
  def show
    recipe = Recipe.find(params[:id].to_i)
    if recipe.user == current_user
      @recipe = recipe
    else
      redirect_to recipes_path
    end
  end
  
  def update
    @recipe = Recipe.find(params[:id].to_i)
    if @recipe.user = current_user
      if @recipe.update(recipe_params)
        redirect_to recipes_path, notice: 'Recipe successfully updated !'
      else
        render :edit
      end
    else
      redirect_to recipes_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id].to_i)
    if @recipe.user = current_user
      if @recipe.destroy
        redirect_to recipes_path, alert: 'Recipe successfully deleted !'
      else
        render :show
      end
    else
      redirect_to recipes_path
    end
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.

  def recipe_params
    params.require(:recipe).permit(:name, :content, :recipe_photo, :user)
  end

end

