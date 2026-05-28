class DinnersController < ApplicationController
  def new
    @dinner = Dinner.new
    @dinner.dinner_recipes.build
    @dinner.dinner_guests.build
    load_form_collections
  end

  def index
    @dinners = current_user.dinners
  end

  def create
    @dinner = current_user.dinners.build(dinner_params)
    load_form_collections

    if @dinner.save
      redirect_to dinners_path, notice: 'Dinner successfully saved !'
    else
      render :new
    end
  end

  def edit
    @dinner = current_user.dinners.find(params[:id])
    load_form_collections
  end

  def show
    @dinner = current_user.dinners.find(params[:id])
  end

  def update
    @dinner = current_user.dinners.find(params[:id])
    load_form_collections

    if @dinner.update(dinner_params)
      redirect_to @dinner, notice: 'Dinner successfully updated !'
    else
      render :edit
    end
  end
  
  def destroy
    @dinner = current_user.dinners.find(params[:id])
    if @dinner.destroy
      redirect_to dinners_path, alert: 'Dinner successfully deleted !'
    else
      render :show
    end
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.

  def dinner_params
    params.require(:dinner).permit(:dinner_date, dinner_recipes_attributes: [:id, :recipe_id, :_destroy], dinner_guests_attributes: [:id, :guest_id, :_destroy])
  end

  def load_form_collections
    @recipes = current_user.recipes
    @guests = current_user.guests
  end

end
