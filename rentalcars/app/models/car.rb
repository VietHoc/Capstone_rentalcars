class Car < ApplicationRecord
	has_many :requests
	def self.search(search)
     if search
        where(["brand LIKE ?", "%#{search}%"])
     else
       all
     end
   	end

  	def handing_car(car_id)
   		update_columns(pickup: Request.where(["car_id = ?", car_id]).first.pickup)
   		update_columns(dropoff: Request.where(["car_id = ?", car_id]).first.dropoff)
   	end
    def cancel_car
      update_columns(pickup: nil)
      update_columns(dropoff: nil)
    end
end
