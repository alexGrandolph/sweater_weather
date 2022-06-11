class BackgroundService 

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/')
  end

  def self.get_background_for_location(location)
    response = conn.get('search/photos?') do |c|
      c.params['query'] = location
      c.params['order_by'] = 'relevant'
      c.params['per_page'] = 1
      c.params['client_id'] = ENV['UNSPLASH_KEY']
    end 
    # binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end 




end 