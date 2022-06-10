require 'rails_helper'

RSpec.describe 'Get Forecast Endpoint' do

  it 'returns serialized JSON forcast for a given city', :vcr do
    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    city = 'boston,ma'

    get '/api/v1/forecast', headers: headers, params: { location: city }
    
    expect(response).to be_successful
    expect(response.status).to eq(200)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to be_a Hash
  end 





end 