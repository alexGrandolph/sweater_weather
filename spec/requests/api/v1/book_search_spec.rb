require 'rails_helper'

RSpec.describe 'Get Book-Search Endpoint' do
  it 'returns a JSON respones contaning books backing search parameters' do
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
    
    data = full_result[:data]

    expect(data).to have_key(:location)
    
    expect(data).to have_key(:forecast)
    expect(data[:forecast]).to have_key(:summary)
    expect(data[:forecast]).to have_key(:temperature)
    
    expect(data).to have_key(:total_books_found)
    expect(data[:total_books_found]).to be_an Integer

    expect(data).to have_key(:books)
    expect(data[:books]).to be_an Array

    data[:books].each do |book|

      expect(book).to be_a Hash
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an Array

      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an Array
    
    end

  end
end