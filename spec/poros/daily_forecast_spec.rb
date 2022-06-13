require 'rails_helper'

RSpec.describe DailyForecast do

  it 'exists and has readable attributes', :vcr do
    data = {dt: 1655049600,
    sunrise: 1655024821,
    sunset: 1655079681,
    moonrise: 1655073120,
    moonset: 1655018820,
    moon_phase: 0.43,
    temp: {day: 77.27, min: 58.28, max: 77.27, night: 66.65, eve: 71.89, morn: 59.41},
    feels_like: {day: 76.86, night: 66.83, eve: 71.83, morn: 59},
    pressure: 1015,
    humidity: 46,
    dew_point: 54.61,
    wind_speed: 14.03,
    wind_deg: 206,
    wind_gust: 23.31,
    weather: [{id: 500, main: "Rain", description: "light rain", icon: "10d"}],
    clouds: 98,
    pop: 0.64,
    rain: 0.44,
    uvi: 6.51}
    daily = DailyForecast.new(data)

    expect(daily).to be_a DailyForecast
    expect(daily.datetime).to eq("06/12/2022")
    expect(daily.sunrise).to eq("03:07:01 AM")
    expect(daily.sunset).to eq("06:21:21 PM")
    expect(daily.max_temp).to eq(77.27)
    expect(daily.min_temp).to eq(58.28)
    expect(daily.conditions).to eq("Rain")
    expect(daily.icon).to eq("10d")
    
  end 
end
