class RoadTripFacade

  def self.route(origin, destination)
    data = RouteService.get_route(origin, destination)
    if data[:info][:messages].blank? == true 
      route = Route.new(data)
      unformatted = LocationService.location_by_city(destination)
      location = Location.new(unformatted)
      forecast_data = ForecastService.forecast_by_lat_long(location.latitude, location.longitude)
      forecast = Forecast.new(forecast_data)
      road_trip = RoadTrip.new(forecast, route)
    else
      road_trip = []
    end 
  end 
  


end 