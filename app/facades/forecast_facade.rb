class ForecastFacade


  def self.get_forcast(latitude, longitude)
    result = ForecastService.forecast_by_lat_long(latitude, longitude)
    binding.pry
    current = CurrentWeather.new(results[:current])
    hourly = HourlyWeather.new(results[:hourly])
    daily = DailyWeather.new(results[:daily])
  end 


end 