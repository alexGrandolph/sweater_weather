require 'rails_helper'

RSpec.describe BookForecastFacade do

  it 'returns a Forecast poro', :vcr do
    forecast = BookForecastFacade.get_book_destination_forecast('albuquerque,nm')

    expect(forecast).to be_a Forecast
  end



end 