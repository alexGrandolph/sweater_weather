require 'rails_helper'

RSpec.describe 'Get Book-Search Endpoint' do
  describe 'Happy Path' do
    it 'returns a JSON respones contaning books backing search parameters', :vcr do
      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = 'boston,ma'
      get '/api/v1/book-search', headers: headers, params: { location: city, quantity: 5 }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      full_result = JSON.parse(response.body, symbolize_names: true)
      expect(full_result).to have_key(:data)

      expect(full_result[:data]).to have_key(:id)
      expect(full_result[:data]).to have_key(:type)
      expect(full_result[:data]).to have_key(:attributes)
    
      data = full_result[:data][:attributes]

      expect(data).to have_key(:destination)
      
      expect(data).to have_key(:forecast)
      expect(data[:forecast]).to be_a Hash
      expect(data[:forecast]).to have_key(:summary)
      expect(data[:forecast]).to have_key(:temperature)
      
      expect(data).to have_key(:total_books_found)
      expect(data[:total_books_found]).to be_an Integer

      expect(data).to have_key(:books)
      expect(data[:books]).to be_an Array
      expect(data[:books].count).to eq(5)

      data[:books].each do |book|
        expect(book).to be_a Hash
        expect(book).to have_key(:isbn)
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
      end
    end
  end 
  describe 'Sad Path' do
    it 'giving quantity less than or equal to zero results in quantity error response', :vcr do

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = 'seattle,wa'
      get '/api/v1/book-search', headers: headers, params: { location: city, quantity: -5 }


      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:error)

      expect(result[:data][:error]).to have_key(:message)
      expect(result[:data][:error][:message]).to eq("Quantity must be a positive integer greater than zero")
    end 
    it 'giving empty location results in empty location error response', :vcr do

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      city = ''
      get '/api/v1/book-search', headers: headers, params: { location: city, quantity: 5 }

      result = JSON.parse(response.body, symbolize_names: true)
      
      expect(result).to have_key(:data)
      expect(result[:data]).to have_key(:error)

      expect(result[:data][:error]).to have_key(:message)
      expect(result[:data][:error][:message]).to eq("Location parameter cannot be blank")

    end 

  end
end