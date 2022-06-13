require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  describe 'Happy Path' do
    it 'Posts a new user to the database' do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'mydogskeeter@skeeter.dog',
        "password": "skeeter",
        "password_confirmation": "skeeter"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(payload)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(result).to have_key(:data)
      data = result[:data]

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("users")
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String 
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash

      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:email]).to be_a String
      expect(data[:attributes][:api_key]).to be_a String

    end
  end
  
  describe 'Sad Path' do
    it 'returns a password not matching error if passwords do not match', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'mydogskeeter@skeeter.dog',
        "password": "skeeter",
        "password_confirmation": "lugnut"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(payload)
      expect(response.status).to eq(401)

      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:error)

      expect(result[:data][:error]).to have_key(:message)
      expect(result[:data][:error][:message]).to eq("Passwords do not match")




    end 







  end

end