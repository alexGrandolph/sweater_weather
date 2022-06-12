require 'rails_helper'

RSpec.describe CurrentForecast do

  it 'exists and has readable attributes' do
    data = {
              "dt": 1654893027,
              "sunrise": 1654852037,
              "sunset": 1654906818,
              "temp": 75.43,
              "feels_like": 74.61,
              # "pressure": 1008,
              "humidity": 42,
              # "dew_point": 284.35,
              "uvi": 2.18,
              # "clouds": 40,
              "visibility": 10000,
              "wind_speed": 5.66,
              "wind_deg": 270,
              "wind_gust": 10.29,
              "weather": [
                          {
                              "id": 802,
                              "main": "Clouds",
                              "description": "scattered clouds",
                              "icon": "03d"
                          }
                          ]
            }
    current = CurrentForecast.new(data)
    expect(current).to be_a CurrentForecast
    expect(current.datetime).to eq('2022-06-10 14:30:27 -0600')
    expect(current.sunrise).to eq('2022-06-10 03:07:17 -0600')
    expect(current.sunset).to eq('2022-06-10 18:20:18 -0600')
    expect(current.temp).to eq(75.43)
    expect(current.feels_like).to eq(74.61)
    expect(current.humidity).to eq(42)
    expect(current.uvi).to eq(2.18)
    expect(current.visibility).to eq(10000)
    expect(current.conditions).to eq("Clouds")
    expect(current.icon).to eq("03d")
  
  end 




end