class RouteService < BaseService

  @base_url = 'http://www.mapquestapi.com/'

  def self.get_route(origin, destination)

    response = conn(@base_url).get('directions/v2/route') do |c|
      c.params['key'] = ENV['MAPQUEST_KEY']
      c.params['from'] = origin
      c.params['to'] = destination
      c.params['unit'] = 'm'
    end
    get_json(response)
  end 

end 