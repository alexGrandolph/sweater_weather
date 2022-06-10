require 'rails_helper'

RSpec.describe ForecastService do

  it 'returns json forecast for given location' do

    forecast = ForecastService.forecast_by_city('denver,co')

    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:results)
    expect(forecast[:results]).to be_an Array
    expect(forecast[:results][1]).to eq(:locations)
    expect(forecast[:locations]).to have_key(:latLng)
    expect(forecast[:locations][:latLng]).to have_key(:lat)
    expect(forecast[:locations][:latLng]).to have_key(:lng)
    expect(forecast[:locations][:latLng][:lat]).to eq(39.738453)
    expect(forecast[:locations][:latLng][:lng]).to eq(-104.984853)
  end 



end 