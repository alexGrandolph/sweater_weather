require 'rails_helper'

RSpec.describe 'Get Backgrounds Endpoint' do
  it 'Returns only desired attributes for image/backgrounds requests', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    city = 'tempe,az'

    get '/api/v1/backgrounds', headers: headers, params: { location: city }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    full_response = JSON.parse(response.body, symbolize_names: true)
    expect(full_response).to have_key(:data)
    expect(full_response).to have_key(:id)
    expect(full_response).to have_key(:attributes)

    background = full_response[:attributes]
    expect(background).to be_a Hash
    expect(background).to have_key(:image)
    expect(background[:image]).to have_key(:location)
    expect(background[:image]).to have_key(:image_url)
  end
end