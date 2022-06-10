require 'rails_helper'

RSpec.describe LocationService do

  it 'returns json forecast for given location', :vcr do

    forecast = LocationService.location_by_city('denver,co')

    expect(forecast).to be_a Hash
    expect(forecast).to have_key(:results)
    expect(forecast[:results]).to be_an Array
    expect(forecast[:results][0]).to have_key(:locations)
    expect(forecast[:results][0][:locations][1]).to have_key(:latLng)
    expect(forecast[:results][0][:locations][1][:latLng]).to have_key(:lat)
    expect(forecast[:results][0][:locations][1][:latLng]).to have_key(:lng)
    expect(forecast[:results][0][:locations][1][:latLng][:lat]).to eq(39.738453)
    expect(forecast[:results][0][:locations][1][:latLng][:lng]).to eq(-104.984853)
  end 



end 