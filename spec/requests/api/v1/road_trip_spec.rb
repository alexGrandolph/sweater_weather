require 'rails_helper'

RSpec.describe 'Road Trip Endpoint' do
  describe 'Happy Path' do
    it 'Returns road trip data for a trip that is less than 24 horus' do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'
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
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)

      attributes = result[:data][:attributes]
      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to eq('denver, co')
      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to eq('albuquerque, nm')

      expect(attributes).to have_key(:travel_time)
      expect(attributes).to have_key(:travel_distance)

      expect(attributes).to have_key(:weather_at_eta)
      expect(attributes[:weather_at_eta]).to have_key(:temperature)
      expect(attributes[:weather_at_eta]).to have_key(:conditions)
    
      expect(attributes[:weather_at_eta][:temperature]).to be_a Float
      expect(attributes[:weather_at_eta][:conditions]).to be_a String

    end 
    it 'Returns road trip data for a trip that is more than 24 horus' do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'
      })
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "origin": 'seattle, wa',
        "destination": "new york, ny",
        "api_key": "75fb908a28ee7690ff8c2d8c2c5fdb"
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(payload)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)

      attributes = result[:data][:attributes]
      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to eq('seattle, wa')
      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to eq('new york, ny')

      expect(attributes).to have_key(:travel_time)
      expect(attributes).to have_key(:travel_distance)
      expect(attributes).to have_key(:weather_at_eta)
      expect(attributes[:weather_at_eta]).to have_key(:temperature)
      expect(attributes[:weather_at_eta]).to have_key(:conditions)
      expect(attributes[:weather_at_eta][:temperature]).to be_a Float
      expect(attributes[:weather_at_eta][:conditions]).to be_a String

    end 
  end 

  describe 'Sad Path' do

    it 'returns impossible route, if route is impossible' do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'
      })
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "origin": 'honolulu,hi',
        "destination": "milwaukee, wi",
        "api_key": "75fb908a28ee7690ff8c2d8c2c5fdb"
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(payload)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:type)
      expect(result[:data]).to have_key(:attributes)

      attributes = result[:data][:attributes]
      expect(attributes).to have_key(:start_city)
      expect(attributes[:start_city]).to eq('honolulu,hi')
      expect(attributes).to have_key(:end_city)
      expect(attributes[:end_city]).to eq('milwaukee, wi')
      expect(attributes).to have_key(:travel_time)
      expect(attributes).to have_key(:travel_distance)

      expect(attributes[:travel_time]).to eq("impossible route")
      expect(attributes[:travel_distance]).to eq("impossible route")

    end 

    it 'returns 401 status if invalid api key is given' do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        api_key: '75fb908a28ee7690ff8c2d8c2c5fdb'
      })
      
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "origin": 'honolulu,hi',
        "destination": "milwaukee, wi",
        "api_key": "totally legi api key don't worry"
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(payload)

      expect(response.status).to eq(401)
      result = JSON.parse(response.body, symbolize_names: true)





  end
end 