require 'rails_helper'

RSpec.describe ForecastService do

  it 'returns forecast JSON data for a given latitude & longitude', :vcr do
    lat = 42.358894
    long = -71.056742
    forecast = ForecastService.forecast_by_lat_long(lat, long)

    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:current)
    expect(forecast).to have_key(:hourly)
    expect(forecast).to have_key(:daily)


  end 





end 
