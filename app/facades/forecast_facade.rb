class ForecastFacade


  def self.get_forecast(latitude, longitude)
    result = ForecastService.forecast_by_lat_long(latitude, longitude)
    Forecast.new(result)
  end 


end 