class ForecastService < BaseService
  @base_url = 'https://api.openweathermap.org/data/2.5/onecall?'

  # def self.conn
  #   Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall?')
  # end

  def self.forecast_by_lat_long(latitude, longitude)
    response = conn(@base_url).get do |c|
      c.params['lat'] = latitude
      c.params['lon'] = longitude
      c.params['units'] = 'imperial'
      c.params['appid'] = ENV['WEATHER_KEY']
    end
    get_json(response)
    # JSON.parse(response.body, symbolize_names: true)
  end 






end 