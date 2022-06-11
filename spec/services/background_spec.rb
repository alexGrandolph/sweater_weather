require 'rails_helper'

RSpec.describe BackgroundService do

  it 'returns background image JSON data for a given location', :vcr do

    response = BackgroundService.get_background_for_location('miami,fl')

    expect(response).to be_a Hash
    expect(response).to have_key(:results)
    expect(response[:results]).to be_an Array
    expect(response[:results].count).to eq(1)
    binding.pry
    expect(response[:results][0]).to have_key(:urls)
    expect(response[:results][0][:urls]).to have_key(:full)

    expect(response[:results][0]).to have_key(:user)
    expect(response[:results][0][:user]).to have_key(:location)
    expect(response[:results][0][:user]).to have_key(:name)


  end 
end 
