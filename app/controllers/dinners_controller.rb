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
      redirect_to dinners_path, notice: 'Dinner successfully saved !'
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
    @dinner = Dinner.find(params[:id].to_i)
    if @dinner.user == current_user
      if @dinner.update(dinner_params)
        redirect_to dinners_path, notice: 'Recipe successfully updated !'
      else
        render :edit
      end
    else
      redirect_to dinners_path
    end
  end
  def destroy
    @dinner = Dinner.find(params[:id].to_i)
    if @dinner.user = current_user
      if @dinner.destroy
        redirect_to dinners_path, alert: 'Dinner successfully deleted !'
      else
        render :show
      end
    else
      redirect_to dinners_path
    end
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
