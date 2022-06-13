class BookFacade


  def self.get_the_books(location, quantity)
    data = BookService.get_books(location, quantity)

    books = [] 
    data.each do |book|
      books << Book.new(book)
    end
    books

  end 


end