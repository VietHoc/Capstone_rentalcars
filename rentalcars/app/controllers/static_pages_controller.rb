class StaticPagesController < ApplicationController
  def home
    @cars = Car.paginate(page: params[:page])
    if logged_in?
    @requests = current_user.requests.where(["status LIKE ? ", -1])
    @cars = Array.new
    @date = Array.new
    @requests.each {|b| @cars << Car.find_by(id: b.car_id)} 
    end
  end
  def help
  end

  def about
  end

  def contact
  end
end