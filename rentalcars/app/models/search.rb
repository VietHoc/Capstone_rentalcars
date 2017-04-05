class Search < ActiveRecord::Base
	def search_cars
			cars = Car.all		
			cars = cars.where(["brand LIKE :key OR 	model LIKE :key OR 	price LIKE :key OR 	seat LIKE :key", key:"%#{brand}%"]) if brand.present?
			cars = cars.where(["isCar LIKE ?", isCar]) if isCar.present? 	
			cars = cars.where('(pickup IS NULL OR pickup > :dropoff) OR (dropoff IS NULL OR dropoff < :pickup)', pickup: pickup, dropoff: dropoff)
			return cars
	end
end