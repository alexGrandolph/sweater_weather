class BookService < BaseService
  
  @base_url = "http://openlibrary.org/"
  
  def self.get_books(location, quantity)
    response = conn(@base_url).get('search.json') do |c|
      c.params['place'] = location
      c.params['limit'] = quantity
    end
    get_json(response)
  end
end