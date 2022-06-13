class BookService < BaseService

  def self.get_books(location, quantity)
    connection = conn("http://openlibrary.org/")
    response = connection.get('search.json') do |c|
      c.params['place'] = location
      c.params['limit'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end