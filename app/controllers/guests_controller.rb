class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end
  def index
    @guests = Guest.all
  end
  def create
    @guest = Guest.new(guest_params)
    if @guest.save
           redirect_to guests_path
        else
            render :new
        end
  end

  def edit
    @guest = Guest.find(params[:id].to_i)
  end
  def show
    @guest = Guest.find(params[:id].to_i)
  end
  def update
    @guest = Guest.find(params[:id].to_i)
    if @guest.update(guest_params)
      redirect_to guests_path
    else
      render :edit
    end

  end
  def destroy
    Guest.destroy(params[:id].to_i)
    redirect_to guests_path
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :guest_photo)
  end

end
