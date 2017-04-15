class CarsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy
  def new
    @car = Car.new
  end
  def search
   @cars = Car.search(params[:search]).paginate(page: params[:page])
 end
   
  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:info] = "Done Creat New Car!"
      render 'show'
    else
      render 'new'
    end
  end

  def index
    @cars = Car.paginate(page: params[:page])
  end

  def show
    session[:car_id] = params[:id].to_i
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update_attributes(car_params)
       flash[:success] = "Car updated"
      redirect_to 
    else
      render 'edit'
    end
  end
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end

  def destroy
    Car.find(params[:id]).destroy
    flash[:succes] = "Car deleted"
    redirect_to cars_url
  end

  private

    def car_params
      params.require(:car).permit(:isCar, :brand, :model, :price, :seat, :about, :pickup, :dropoff)
    end

    # Before filters

    # def get_vehicle
    #   @vehicle = vehicle.find_by(email: params[:email])
    # end

end