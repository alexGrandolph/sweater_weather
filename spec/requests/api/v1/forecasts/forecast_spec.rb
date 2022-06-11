require 'rails_helper'

RSpec.describe 'Get Forecast Endpoint' do
  describe 'Current Weather In Response Test' do
    it 'Current weather attribute is present with only desired keys/values', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = 'boston,ma'

      get '/api/v1/forecast', headers: headers, params: { location: city }
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      raw_forecast = JSON.parse(response.body, symbolize_names: true)
      expect(raw_forecast).to have_key(:data)
      
      forecast = raw_forecast[:data]
      
      expect(forecast).to be_a Hash
      expect(forecast).to have_key(:id)
      expect(forecast[:type]).to eq('forecast')
      expect(forecast[:attributes]).to be_a Hash

      attributes = forecast[:attributes]
      expect(attributes).to have_key(:current_weather)
      expect(attributes[:current_weather]).to be_a Hash
      expect(attributes[:current_weather]).to have_key(:datetime)
      expect(attributes[:current_weather]).to have_key(:sunrise)
      expect(attributes[:current_weather]).to have_key(:sunset)
      expect(attributes[:current_weather]).to have_key(:feelsLike)
      expect(attributes[:current_weather]).to have_key(:humidity)
      expect(attributes[:current_weather]).to have_key(:uvi)
      expect(attributes[:current_weather]).to have_key(:visibility)
      expect(attributes[:current_weather]).to have_key(:conditions)
      expect(attributes[:current_weather]).to have_key(:icon)

      expect(attributes[:current_weather]).to_not have_key(:clouds)
      expect(attributes[:current_weather]).to_not have_key(:windspeed)
      expect(attributes[:current_weather]).to_not have_key(:pressure)
      expect(attributes[:current_weather]).to_not have_key(:dewpoint)
      expect(attributes[:current_weather]).to_not have_key(:wind_deg)
      expect(attributes[:current_weather]).to_not have_key(:wind_gust)
      expect(attributes[:current_weather]).to_not have_key(:weather)
    end 
  end 

  describe 'Daily Weather In Response Test' do

    it 'Daily weather attribute is present with only desired keys/values', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = 'san francisco,ca'

      get '/api/v1/forecast', headers: headers, params: { location: city }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast[:attributes]).to have_key(:daily_weather)
      
      daily = forecast[:attributes][:daily_weather]
      
      expect(daily).to be_an Array
      expect(daily.count).to eq(5)

      daily.each do |day|
        expect(day).to have_key(:datetime)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
      end 
    end 
  end 

  describe "Hourly Weather In Response Test" do

    it 'Hourly weather attribute is present with only desired keys/values', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = 'ontario,ca'

      get '/api/v1/forecast', headers: headers, params: { location: city }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast[:attributes]).to have_key(:hourly_weather)
      
      hourly = forecast[:attributes][:hourly_weather]

      expect(hourly).to be_an Array
      expect(hourly.count).to eq(8)

      hourly.each do |hour|
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temp)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
      end 
    end 
  end 
end 