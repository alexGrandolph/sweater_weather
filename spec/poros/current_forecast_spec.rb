require 'rails_helper'

RSpec.describe CurrentForecast do

    it 'exists and has readable attributes', :vcr do
    lat = 42.358894
    long = -71.056742
    data = ForecastService.forecast_by_lat_long(lat, long)

    current = CurrentForecast.new(data)
    expect(current).to be_a CurrentForecast
    expect(current.datetime).to be_a String 
    expect(current.sunrise).to be_a String
    expect(current.sunset).to be_a String 
    expect(current.temp).to eq(70.81)
    expect(current.feels_like).to eq(70.93)
    expect(current.humidity).to eq(71)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("Clouds")
    expect(current.icon).to eq("04d")
    
  end 
  
  
  
  
end
# data = {
#           "dt": 1654893027,
#           "sunrise": 1654852037,
#           "sunset": 1654906818,
#           "temp": 75.43,
#           "feels_like": 74.61,
#           # "pressure": 1008,
#           "humidity": 42,
#           # "dew_point": 284.35,
#           "uvi": 2.18,
#           # "clouds": 40,
#           "visibility": 10000,
#           "wind_speed": 5.66,
#           "wind_deg": 270,
#           "wind_gust": 10.29,
#           "weather": [
#                       {
#                           "id": 802,
#                           "main": "Clouds",
#                           "description": "scattered clouds",
#                           "icon": "03d"
#                       }
#                       ]
#         }