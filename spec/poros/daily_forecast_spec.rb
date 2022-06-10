require 'rails_helper'

RSpec.describe DailyForecast do

  it 'exists and has readable attributes', :vcr do
    data = ForecastService.forecast_by_lat_long(42.358894, -71.056742)[:daily]

    daily = DailyWeather.new(data)

    expect(daily).to be_a DailyForecast

  end 


end
