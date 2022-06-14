require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  describe 'Happy Path Sign Up' do
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
  
  describe 'Sad Path Sign Up' do
    
    it 'returns a password not matching error if passwords do not match', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'mydogskeeter@skeeter.dog',
        "password": "skeeter",
        "password_confirmation": "lugnut"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(payload)
      expect(response.status).to eq(422)

      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to have_key(:errors)
      expect(result[:errors]).to have_key(:password)

      expect(result[:errors][:password]).to eq(["Passwords do not match"])
    end 

    it 'returns a user already exists error if email is already in database', :vcr do
      user = User.create!({
        email: 'mydogskeeter@skeeter.dog',
        password: "dogdogdog",
        password_confirmation: "dogdogdog"
      })
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'mydogskeeter@skeeter.dog',
        "password": "skeeter",
        "password_confirmation": "skeeter"
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(payload)
      expect(response.status).to eq(422)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:errors)
      expect(result[:errors]).to have_key(:email)

      expect(result[:errors][:email]).to eq(["has already been taken"])
    end 
  end

  describe 'User Login Happy Path' do

    it 'Sends back a users email, id, and api key' do
      user = User.create!({
          email: 'skeeterthecorgi@skeeter.dog',
          password: "dogdogdog",
          password_confirmation: "dogdogdog"
        })

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'skeeterthecorgi@skeeter.dog',
        "password": "dogdogdog",
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(payload)

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(result).to have_key(:data)
      data = result[:data]

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("users")
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String 
      expect(data[:id]).to eq(user.id.to_s)
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash

      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:email]).to be_a String

      expect(data[:attributes][:email]).to eq(user.email)
      expect(data[:attributes][:api_key]).to eq(user.api_key)
    end 
  end 

  describe 'User Login Sad Path' do

    it 'Sends back a 400 status when given bad password' do
      user = User.create!({
          email: 'skeeterthecorgi@skeeter.dog',
          password: "dogdogdog",
          password_confirmation: "dogdogdog"
        })

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'skeeterthecorgi@skeeter.dog',
        "password": "corgi",
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(payload)

      expect(response.status).to eq(422)
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:errors)
      expect(result[:errors]).to have_key(:credentials)

      expect(result[:errors][:credentials]).to eq(["Bad credentials"])
    end 

    it 'Sends back a 400 status when given bad email' do
      user = User.create!({
          email: 'skeeterthecorgi@skeeter.dog',
          password: "dogdogdog",
          password_confirmation: "dogdogdog"
        })

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      payload = {
        "email": 'corgi@skeeter.dog',
        "password": "dogdogdog",
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(payload)

      expect(response.status).to eq(422)
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to have_key(:errors)
      expect(result[:errors]).to have_key(:credentials)

      expect(result[:errors][:credentials]).to eq(["Bad credentials"])
    end 
  end
end