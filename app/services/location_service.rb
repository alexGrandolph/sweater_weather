class LocationService 
  
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/address?') do |f|
      f.params['key'] = ENV['MAPQUEST_KEY']
    end
  end

  def self.location_by_city(city)
    response = conn.get do |c|
      c.params['location'] = city
    end
    JSON.parse(response.body, symbolize_names: true)
  end 



end 