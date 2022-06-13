class BookForecastFacade

  def self.get_book_destination_forecast(city)
    location = LocationFacade.coordinates_for_city(city)
    forecast = ForecastFacade.get_forecast(location.latitude, location.longitude)
  end 


end 