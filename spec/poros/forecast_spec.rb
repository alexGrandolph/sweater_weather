require 'rails_helper'

RSpec.describe Forecast do

  it 'exists and has readable attributes', :vcr do

    raw = File.read('spec/fixtures/handrolled/forecast.json')
    data = JSON.parse(raw, symbolize_names: true)
    current = Forecast.new(data)

    expect(current).to be_a Forecast
    expect(current.datetime).to eq("2022-06-12 20:37:27 -0600")
    expect(current.sunrise).to eq("2022-06-12 03:07:01 -0600")
    expect(current.sunset).to eq("2022-06-12 18:21:21 -0600")
    expect(current.temp).to eq(66.2)
    expect(current.feels_like).to eq(66.52)
    expect(current.humidity).to eq(85)
    expect(current.uvi).to eq(0)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("Clouds")
    expect(current.icon).to eq("04n")
    
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