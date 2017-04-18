class RequestsController < ApplicationController
  before_action :get_user_and_car,     only: [:create, :update, :destroy]
  before_action :get_request,         only: [:update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  include SessionsHelper

  def new
    @request = Request.new
  end


  def create
    if available_to_request?
      if current_user.requests.count == 5
        flash[:warning] = "Can't send over 5 requests."
        redirect_to root_path  
      else  
        @request = Request.create(user_id: current_user.id,
                                car_id: params[:car_id],
                                verified: false,
                                pickup: params[:request][:pickup],
                                dropoff: params[:request][:dropoff])
        flash[:success] = "Request rental has been sent"
        redirect_to root_path
      end
    else
      flash[:warning] = "Date not available. Please choose again."     
      redirect_to new_request_path(car: params[:car_id])
    end
  end

  def update
    if current_user.admin?
      if params[:verify]
        @request.verify_status_request
      elsif params[:hand]  
        @request.handing_request
        @car.handing_car(params[:car_id])
      elsif params[:cancel]
        @request.cancel_request
        @car.cancel_car
      else
        flash[:danger] = "You did something wrong!"
      end
    end
    render 'users/show'
  end

  def destroy
    Request.find(params[:id]).delete
    flash[:succes] = "Request deleted"
    redirect_to '/'

  end

  private 
    def available_to_request?
      if params[:request][:pickup].blank? || params[:request][:dropoff].blank?  || params[:request][:pickup] > params[:request][:dropoff]
        return false
      elsif
          Car.find(params[:car_id]).dropoff.blank? || Car.find(params[:car_id]).pickup.blank? || (params[:request][:pickup] > Car.find(params[:car_id]).dropoff ) || (params[:request][:dropoff] < Car.find(params[:car_id]).pickup)
          return true
      else
          return false
      end
    end

    def get_user_and_car
      @user = User.find(current_user.id)
      @car = Car.find(params[:car_id])
    end

    def get_request
      @request = Request.find_by(id: params[:id])
    end
end