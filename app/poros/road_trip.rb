class RoadTrip
  attr_reader :forecast, :route, :forecast_at_arrival, :distance, :travel_time, :distance

  def initialize(forecast, route)
    @forecast = forecast
    @route = route
    @arrival_time = Time.now + route.total_seconds
    @total_seconds = route.total_seconds
    @forecast_at_arrival = forecast_at_arrival
    @time = route.time
    @travel_time = travel_time
    @distance = "#{route.distance.round(0)} miles"
    
  end
  
  def forecast_at_arrival
    total_hours = @total_seconds / 3600
    if total_hours < 24
      arrival_forecast = @forecast.hourly[total_hours - 1]
    else total_hours >= 24
      arrival_forecast = @forecast.daily[(total_hours - 1) / 24]
    end 
    arrival_forecast
  end

  def travel_time
    time_array = @time.split(":")
    "#{time_array[0]} hours, #{time_array[1]} minutes"
    # binding.pry
  end 

end 