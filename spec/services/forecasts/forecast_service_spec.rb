require 'rails_helper'

RSpec.describe ForecastService do

  it 'returns json forecast for given location' do

    forecast = ForecastService.weather_for_city('denver,co')

    expect(forecast).to be_a Hash
    expect(forecast).to have_key[:data]
    # expect(forecast[:data]).to have_key(:type)
    # expect(forecast[:data][:type]).to eq('forecast')
    # expect(forecast[:data]).to have_key(:attributes)

  end 



end 