require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe 'Happy Path' do
    it 'Returns road trip data', :vcr do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        api_key: SecureRandom.hex(15)
      })
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "origin": 'denver, co',
        "destination": "albuquerque, nm",
        "api_key": "75fb908a28ee7690ff8c2d8c2c5fdb"
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(payload)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:type]).toeq('roadtrip')
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)

      attributes = result[:data][:attributes]
      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to eq('denver, co')
      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to eq('albuquerque, nm')

      expect(attributes).to have_key(:travel_time)
      expect(attributes).to have_key(:weather_at_eta)
      expect(attributes[:weather_at_eta]).to have_key(:temperature)
      expect(attributes[:weather_at_eta]).to have_key(:conditions)
      expect(attributes[:weather_at_eta][:temperature]).to be_a Float

    end 




  end 
end 