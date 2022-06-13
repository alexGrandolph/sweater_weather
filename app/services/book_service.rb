class BookService

  def self.get_books(location, quantity)
    conn = Faraday.new(url: "http://openlibrary.org/")
    response = conn.get('search.json') do |c|
      c.params['place'] = location
      c.params['limit'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end