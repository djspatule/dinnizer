class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end
  def index
    @guests = Guest.where(user: current_user)
  end
  def create
    @guest = Guest.new(guest_params)
    @guest.user = current_user
    if @guest.save
           redirect_to guests_path, notice: 'Guest successfully saved !'
    else
            render :new
    end
  end

  def edit
    @guest = Guest.find(params[:id].to_i)
  end
  
  def show
    guest = Guest.find(params[:id].to_i)
    if guest.user == current_user
      @guest = guest
    else
      redirect_to guests_path
    end
  end
  
  def update
    @guest = Guest.find(params[:id].to_i)
    if @guest.user == current_user
      if @guest.update(guest_params)
        redirect_to guests_path, notice: 'Guest successfully updated !'
      else
        render :edit
      end
    else
      redirect_to guests_path
    end
  end
  
  def destroy
    @guest = Guest.find(params[:id].to_i)
    if @guest.user == current_user
      if @guest.destroy
        redirect_to guests_path, alert: 'Guest successfully deleted !'
      else
        render :show
      end
    else
      redirect_to guests_path
    end
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :guest_photo, :user)
  end

end
