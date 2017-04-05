class StaticPagesController < ApplicationController
  def home
    if logged_in?
    end
    @cars = Car.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end