class DinnersController < ApplicationController
def new
    @dinner = Dinner.new
    @dinner_recipes = DinnerRecipe.new
    @dinner_guests = DinnerGuest.new
  end
  def index
    @dinners = Dinner.where(user: current_user)
  end
  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.user = current_user
    if dinner_params[:recipe_id]
      @dinner_recipe = DinnerRecipe.new(dinner_params)
      if @dinner_recipe.save
        redirect_to dinners_path
      else
        render :new
      end
    end
    if @dinner.save
      redirect_to dinners_path
    else
      render :new
    end
  end

  def edit
    @dinner = Dinner.find(params[:id].to_i)
  end
  def show
    dinner = Dinner.find(params[:id].to_i)
    if dinner.user == current_user
      @dinner = dinner
    else
      redirect_to dinners_path
    end
  end
  def update
    dinner = Dinner.find(params[:id].to_i)
    if dinner.user == current_user
      dinner.update(dinner_params)
      redirect_to dinners_path
    else
      render :edit
    end

  end
  def destroy
    #protect against deletion by unauthorized user
    Dinner.destroy(params[:id].to_i)
    redirect_to dinners_path
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def dinner_params
    params.require(:dinner).permit(:dinner_date, :recipe_id, :guest_id, :user)
  end


end
