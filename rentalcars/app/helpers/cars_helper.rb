module CarsHelper
    def current_car
        Car.find(session[:car_id])
    end
end