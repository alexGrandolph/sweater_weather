require 'rails_helper'

RSpec.describe HourlyForecast do

  it 'exists and has readable attributes', :vcr do
    data =  {
            "dt": 1655085600,
            "temp": 65.7,
            "feels_like": 65.86,
            "pressure": 1016,
            "humidity": 83,
            "dew_point": 60.4,
            "uvi": 0,
            "clouds": 90,
            "visibility": 10000,
            "wind_speed": 6.08,
            "wind_deg": 186,
            "wind_gust": 19.1,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        }
    hourly = HourlyForecast.new(data)

    expect(hourly).to be_a HourlyForecast
    expect(hourly.time).to eq("20:00:00")
    expect(hourly.temp).to eq(65.7)
    expect(hourly.conditions).to eq("Clouds")
    expect(hourly.icon).to eq("04n")
    
  end 
end
