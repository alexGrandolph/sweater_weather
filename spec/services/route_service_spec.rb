require 'rails_helper'

RSpec.describe RouteService do

  it 'returns Route JSON data for a given location and quantity', :vcr do
    origin = 'denver,co'
    destination = "albuquerque, nm"
    route = RouteService.get_route(origin, destination)

    expect(route).to have_key(:route)
    expect(route[:route]).to have_key(:distance)
    expect(route[:route]).to have_key(:formattedTime)
  end



end 