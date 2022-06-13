class Route
  attr_reader :time, :distance
  
  def initialize(attributes)
    @time = attributes[:route][:formattedTime]
    @distance = attributes[:route][:distance]
  end 


end 