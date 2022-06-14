class RoadTripFacade

  def self.route(origin, destination)
    data = RouteService.get_route(origin, destination)
    route = Route.new(data)
    unformatted = LocationService.location_by_city(destination)
    location = Location.new(unformatted)
    forecast_data = ForecastService.forecast_by_lat_long(location.latitude, location.longitude)
    forecast = Forecast.new(forecast_data)
    roadtrip = RoadTrip.new(forecast, route)

  end 
  


end 