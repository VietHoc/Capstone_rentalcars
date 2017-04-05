class SearchesController < ApplicationController
	def new
		@search = Search.new
		@isCars = Car.uniq.pluck(:isCar)
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		
		@search = Search.find(params[:id])
		
	end

	def search_params
		params.require(:search).permit(:keyboards, :isCar, :brand, :model, :price, :seat, :about, :pickup, :dropoff)
	end

end
