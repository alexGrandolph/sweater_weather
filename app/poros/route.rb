class Route
  attr_reader :time, :distance, :seconds, :total_seconds
  
  def initialize(attributes)
    @time = attributes[:route][:formattedTime]
    @distance = attributes[:route][:distance]
    @seconds = attributes[:route][:realTime]
    @total_seconds = attributes[:route][:legs][0][:time]
  end 


end 