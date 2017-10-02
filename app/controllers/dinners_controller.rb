class DinnersController < ApplicationController
  def new
    @dinner = Dinner.new
    @dinner.dinner_recipes.build
    @dinner.dinner_guests.build
    @recipes = Recipe.where(user: current_user)
    @guests = Guest.where(user: current_user)
  end

  def index
    @dinners = Dinner.where(user: current_user)
  end

  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.user = current_user
    @recipes = Recipe.where(user: current_user)
    @guests = Guest.where(user: current_user)
    recipes = []
    guests = []
    @dinner.dinner_recipes.each do |recipe|
      recipes << recipe.recipe_id
    end
    @dinner.dinner_guests.each do |guest|
      guests << guest.guest_id
    end
   
    if recipes.uniq.length == recipes.length && guests.uniq.length == guests.length
      if @dinner.save
        redirect_to dinners_path, notice: 'Dinner successfully saved !'
      else
        render :new
      end
    else
      flash[:alert] = "You can't add twice the same recipe or guest to a dinner"
      render :new
    end
  end

  def edit
    @dinner = Dinner.find(params[:id].to_i)
    @recipes = Recipe.where(user: current_user)
    @guests = Guest.where(user: current_user)
  end

  def show
    dinner = Dinner.find(params[:id].to_i)
    if dinner.user == current_user
      @dinner = dinner
    else
      redirect_to dinners_path
    end
  end

  # -- TODO : protect against duplication... /!\ the solution used in create doesn't work here as you can't work with @dinner 
  # ('cause it contains the records found by .find and not an empty dinner) but need to work directly with dinner_params
  # that is impossible to enumerate and work on...
  def update
    @dinner = Dinner.find(params[:id].to_i)
    @dinner_recipes = DinnerRecipe.where(dinner_id: @dinner.id)
    @dinner_guests = DinnerGuest.where(dinner_id: @dinner.id)
    if @dinner.user == current_user
      if @dinner.update(dinner_params)
        redirect_to @dinner, notice: 'Recipe successfully updated !'
      else
        render :edit
      end
    else
      redirect_to dinners_path
    end
  end
  
  def destroy
    @dinner = Dinner.find(params[:id].to_i)
    if @dinner.user == current_user
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
    params.require(:dinner).permit(:id, :dinner_date, :user_id, dinner_recipes_attributes: [:id, :recipe_id, :_destroy], dinner_guests_attributes: [:id, :guest_id, :_destroy])
  end


end

