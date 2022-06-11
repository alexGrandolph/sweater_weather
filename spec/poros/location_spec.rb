require 'rails_helper'

RSpec.describe Location do

  it 'exists and has readable attributes', :vcr do
    data = LocationService.location_by_city('denver,co')
    location = Location.new(data)
    expect(location.latitude).to eq(39.738453)
    expect(location.longitude).to eq(-104.984853)
  end 




end 