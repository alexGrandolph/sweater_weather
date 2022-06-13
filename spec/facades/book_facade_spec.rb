require 'rails_helper'

RSpec.describe BookFacade do

  it 'returns a Book poro', :vcr do
    book = BookFacade.get_the_books('denver,co', 3)

    expect(book[0]).to be_all Book
    expect(book[0].count).to eq(3)
  end



end 