class RoadTripSerializer


  def self.road_trip(origin, destination, road_trip)
    # binding.pry
    { "data": {
      "id": 'null',
      "type": 'roadtrip',
      "attributes": {
        "start_city": origin,
        "end_city": destination,
        "travel_time": road_trip.travel_time,
        "travel_distance":  road_trip.distance,
        "weather_at_eta": {
          "temperature":  road_trip.forecast_at_arrival.temp,
          "conditions":  road_trip.forecast_at_arrival.conditions
        }
      }
    }
  }



  end 

end 