class RecipesController < ApplicationController
  def new

  end
  def index
    @recipes = Recipe.all
  end
  def create

  end

  def edit

  end
  def show

  end
  def update

  end
  def destroy

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

