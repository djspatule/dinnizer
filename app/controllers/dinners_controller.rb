class DinnersController < ApplicationController
def new
    @dinner = Dinner.new
  end
  def index
    @dinners = Dinner.all
  end
  def create
    @dinner = Dinner.new(dinner_params)
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
    @dinner = Dinner.find(params[:id].to_i)
  end
  def update
    @dinner = Dinner.find(params[:id].to_i)
    if @dinner.update(dinner_params)
      redirect_to dinners_path
    else
      render :edit
    end

  end
  def destroy
    Dinner.destroy(params[:id].to_i)
    redirect_to dinners_path
  end

private
# Using a private method to encapsulate the permissible parameters is
# a good pattern since you'll be able to reuse the same permit
# list between create and update. Also, you can specialize this method
# with per-user checking of permissible attributes.
  def dinner_params
    params.require(:dinner).permit(:dinner_date, :recipe, :guest)
  end


end
