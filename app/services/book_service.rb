class BookService


  def self.get_books(location, quantity)

    conn = Faraday.new(url: "http://openlibrary.org/")
    
    response = conn.get('search.json') do |c|
      c.params['q'] = location
      c.params['fields'] = '*,availability'
      c.params['limit'] = quantity
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end
end