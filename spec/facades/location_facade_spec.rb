require 'rails_helper'

RSpec.describe LocationFactory do

  it 'returns a Location poro' do
    location = LocationFacade.latitude_longitude('boston,ma')

    expect(location).to be_a(Location)
  end



end 