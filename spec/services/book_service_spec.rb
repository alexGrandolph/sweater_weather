require 'rails_helper'

RSpec.describe BookService do

  it 'returns Book JSON data for a given latitude & longitude', :vcr do
    location = 'denver,co'
    quantity = 5
    book = BookService.get_books(location, quantity)

    expect(book).to be_a Hash
    expect(book).to have_key(:numFoundExact)
    expect(book).to have_key(:docs)
    expect(book[:docs]).to be_an Array
    expect(book[:docs]).to have_key(:title)
    expect(book[:docs]).to have_key(:publisher)


  end 





end 