require 'rails_helper'

RSpec.describe BookFacade do

  it 'returns a Book poro', :vcr do
    book = BookFacade.get_the_books('denver,co', 4)

    expect(book).to be_all Book
    expect(book.count).to eq(4)
  end



end 