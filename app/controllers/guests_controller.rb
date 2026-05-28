class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def index
    @guests = current_user.guests
  end

  def create
    @guest = current_user.guests.build(guest_params)
    if @guest.save
      redirect_to guests_path, notice: 'Guest successfully saved !'
    else
      render :new
    end
  end

  def edit
    @guest = current_user.guests.find(params[:id])
  end
  
  def show
    @guest = current_user.guests.find(params[:id])
    @guest_recipes = []
    # Prepare a list of recipes used in the view without duplicates.
    if @guest.dinners
      @guest.dinners.each do |dinner|
        if dinner.recipes
          dinner.recipes.each { |recipe| @guest_recipes << recipe }
        end
      end
    end
    @guest_recipes.uniq!
  end
  
  def update
    @guest = current_user.guests.find(params[:id])
    if @guest.update(guest_params)
      redirect_to @guest, notice: 'Guest successfully updated !'
    else
      render :edit
    end
  end
  
  def destroy
    @guest = current_user.guests.find(params[:id])
    if @guest.destroy
      redirect_to guests_path, alert: 'Guest successfully deleted !'
    else
      render :show
    end
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :guest_photo, :likes_and_dislikes)
  end

end
