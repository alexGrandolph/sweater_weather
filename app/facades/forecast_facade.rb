class ForecastFacade


  def self.get_forcast(latitude, longitude)
    result = ForecastService.forecast_by_lat_long(latitude, longitude)
  end 


end 