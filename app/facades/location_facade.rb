class LocationFacade 

  def self.coordinates_for_city(city)
    result = LocationService.location_by_city(city)
    Location.new(result)
  end 


end 