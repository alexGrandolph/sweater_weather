require 'rails_helper'

RSpec.describe BackgroundService do

  it 'returns background image JSON data for a given location', :vcr do

    response = BackgroundService.get_background_for_location('miami,fl')

    expect(response).to be_a Hash
  
    expect(response).to have_key(:urls)
    expect(response[:urls]).to have_key(:full)

    expect(response).to have_key(:user)
    expect(response[:user]).to have_key(:location)
    expect(response[:user]).to have_key(:name)


  end 
end 
