require 'rails_helper'

RSpec.describe LocationFacade do

  it 'returns a Location poro', :vcr do
    location = LocationFacade.coordinates_for_city('boston,ma')

    expect(location).to be_a(Location)
  end



end 