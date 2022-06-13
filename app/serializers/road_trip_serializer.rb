class RoadTripSerializer


  def self.road_trip(origin, destination, route_and_forecast)
    # binding.pry
    { "data": {
      "id": 'null',
      "type": 'roadtrip',
      "attributes": {
        "start_city": origin,
        "end_city": destination,
        "travel_time": route_and_forecast[0].time,
        "travel_distance":  route_and_forecast[0].distance,
        "weather_at_eta": {
          "temperature":  route_and_forecast[1][0].temp,
          "conditions":  route_and_forecast[1][0].conditions
        }
      }
    }
  }



  end 

end 