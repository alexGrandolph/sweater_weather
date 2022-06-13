class RoadTripFacade

  def self.route(origin, destination)
    data = RouteService.get_route(origin, destination)
    route = Route.new(data)
    arrival_time = Time.now + route.seconds
    arrival = arrival_time.strftime("%H:%M:%S")
    unformatted = LocationService.location_by_city(destination)
    location = Location.new(unformatted)
    forecast_data = ForecastService.forecast_by_lat_long(location.latitude, location.longitude)
    forecast = Forecast.new(forecast_data)
    target = []
    forecast.hourly.find do |hour|
      if hour.time < arrival
        target << hour
      end 
    end 
    target
    all_data = [route, target]
  end 
  


end 