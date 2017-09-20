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
    # why is the following useless ????
    # if dinner_params[:recipe_id]
    #   @dinner_recipe = DinnerRecipe.new(dinner_params)
    #   if @dinner_recipe.save
    #     redirect_to dinners_path
    #   end
    # end
    if @dinner.save
      redirect_to dinners_path, notice: 'Dinner successfully saved !'
    else
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

  def update
    @dinner = Dinner.find(params[:id].to_i)
    @dinner_recipes = DinnerRecipe.where(dinner_id: @dinner.id)
    @dinner_guests = DinnerGuest.where(dinner_id: @dinner.id)
    if @dinner.user == current_user
      # recipe_ids = dinner_params[:dinner_recipes_attributes]["0"][:recipe_id]
      # # -- RECIPES -- 
      # # ADD RECIPE TO DINNER : for each recipe that was sent by the user in the "edit form", check if it was already saved or if it is new...and if it is new, save it !
      # if recipe_ids
      #   recipe_ids.each do |recipe_id|
      #     already_saved = false
      #     @dinner_recipes.each do |dinner_recipe|
      #       if dinner_recipe.recipe_id == recipe_id
      #         already_saved = true
      #       end
      #       if already_saved == false
      #         DinnerRecipe.create!(dinner_recipe.dinner_id, dinner_recipe.recipe_id)
      #       end
      #     end
      #   end
      # end
      
      # # DELETE RECIPE FROM DINNER : for each recipe that is already saved, check if it was also sent by the user in the "edit form"...and if not, destroy it !
      # @dinner_recipes.each do |dinner_recipe|
      #   already_saved = false
      #   if recipe_ids
      #     recipe_ids.each do |recipe_id|
      #       if recipe_id == dinner_recipe.recipe_id
      #         already_saved = true
      #       end
      #     end
      #     if already_saved == false
      #       dinner_recipe.destroy
      #     end
      #   end
      # end
      
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

#add :recipe_id, :guest_id ?
  def dinner_params
    params.require(:dinner).permit(:id, :dinner_date, :user_id, dinner_recipes_attributes: [:id, :recipe_id], dinner_guests_attributes: [:id, :guest_id])
  end


end

