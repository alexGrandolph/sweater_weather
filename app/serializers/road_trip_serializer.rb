class RoadTripSerializer


  def self.road_trip(origin, destination, route, forecast)
    { "data": {
      "id": 'null',
      "type": 'roadtrip',
      "attributes": {
        "start_city": origin,
        "end_city": destination,
        "travel_time": route.time,
        "travel_distance": route.distance,
        "weather_at_eta": {
          "temperature": forecast.temperature,
          "conditions": forecast.conditions
        }
      }
    }
  }



  end 

end 