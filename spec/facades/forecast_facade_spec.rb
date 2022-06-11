require 'rails_helper'

RSpec.describe ForecastFacade do

  it 'returns a Forecast poro', :vcr do
    forecast = ForecastFacade.get_forecast(42.358894, -71.056742)

    expect(forecast).to be_a Hash
  end



end 