class BookFacade


  def self.get_the_books(location, quantity)
    data = BookService.get_books(location, quantity)
    num_found = data[:numFound]
    # binding.pry
    return_set = []
    books = [] 
    data[:docs].each do |book|
      books << Book.new(book)
    end
    books
    return_set = [books, num_found]
  end 


end