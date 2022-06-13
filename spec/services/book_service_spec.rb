require 'rails_helper'

RSpec.describe BookService do

  it 'returns Book JSON data for a given location and quantity', :vcr do
    location = 'denver,co'
    quantity = 5
    books = BookService.get_books(location, quantity)

    expect(books).to be_a Hash
    expect(books).to have_key(:numFound)
    expect(books).to have_key(:docs)
    expect(books[:docs]).to be_an Array
    books[:docs].each do |book|
      expect(book).to have_key(:title)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an Array
    end 

    expect(books[:numFound]).to eq(books[:docs].count)

  end 





end 