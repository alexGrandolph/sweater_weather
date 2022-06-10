class ForecastService
  
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall?')
  end

  def self.forecast_by_lat_long(latitude, longitude)
    response = conn.get do |c|
      c.params['lat'] = latitude
      c.params['lon'] = longitude
      c.params['appid'] = ENV['WEATHER_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end 






end 