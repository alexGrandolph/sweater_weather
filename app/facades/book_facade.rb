class BookFacade

  def self.get_the_books(location, quantity)
    data = BookService.get_books(location, quantity)
    num_found = data[:numFound]
    books = data[:docs].map do |book|
      Book.new(book)
    end
    return_set = [books, num_found]
  end 


end