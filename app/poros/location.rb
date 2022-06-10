class Location
  attr_reader :latitude, :longitude

  def initialize(attributes)
    @latitude = attributes[:results][0][:locations][0][:latLng][:lat]
    @longitude = attributes[:results][0][:locations][0][:latLng][:lng]
  end 

end 