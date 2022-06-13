class BookSerializer


  def self.book_search_response(books, forecast, location)
    binding.pry
    { "data":
      {
        "id": 'null',
        "type": 'books',
        "attributes": {
          "destination": location,
          "forecast": {
            "summary": forecast.conditions,
            "temperature": forecast.temp
            },
        
        "total_books_found": books[1],
        "books": books[0].map do |book|
          {
            "isbn": book.isbn,
            "title": book.title,
            "publisher": book.publisher
          }
        end 
        }
      } 
    }

  end


end