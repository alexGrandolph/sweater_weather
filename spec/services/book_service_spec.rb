require 'rails_helper'

RSpec.describe BookService do

  it 'returns Book JSON data for a given location and quantity', :vcr do
    location = 'denver,co'
    quantity = 5
    book = BookService.get_books(location, quantity)

    expect(book).to be_a Hash
    expect(book).to have_key(:numFound)
    expect(book).to have_key(:docs)
    expect(book[:docs]).to be_an Array
    expect(book[:docs][0]).to have_key(:title)
    expect(book[:docs][2]).to have_key(:publisher)


  end 





end 