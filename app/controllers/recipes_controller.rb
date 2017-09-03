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
           redirect_to recipes_path
        else
            render :new
        end
  end

  def edit
  end
  def show
    if recipe.user == current_user
      @recipe = recipe
    else
      redirect_to recipes_path
    end
  end
  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end

  end
  def destroy
    @recipe.destroy
    # Recipe.destroy(params[:id].to_i)
    redirect_to recipes_path
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.

  def set_recipe
    @recipe = Recipe.find(params[:id].to_i)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :content, :recipe_photo, :user)
  end

end

