class Route
  attr_reader :time, :distance, :seconds
  
  def initialize(attributes)
    @time = attributes[:route][:formattedTime]
    @distance = attributes[:route][:distance]
    @seconds = attributes[:route][:realTime]
  end 


end 