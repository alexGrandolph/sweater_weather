class BackgroundService < BaseService

  @base_url = 'https://api.unsplash.com/'
  
  def self.get_background_for_location(location)
    response = conn(@base_url).get('search/photos?') do |c|
      c.params['query'] = location
      c.params['order_by'] = 'relevant'
      c.params['per_page'] = 1
      c.params['client_id'] = ENV['UNSPLASH_KEY']
    end 
    result = get_json(response)
    result[:results][0]
  end 
  
end 
# def self.conn
#   Faraday.new(url: 'https://api.unsplash.com/')
# end