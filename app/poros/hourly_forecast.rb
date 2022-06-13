class HourlyForecast
  attr_reader :datetime, :time, :temp, :conditions, :icon

  def initialize(attributes)
    @time = Time.at(attributes[:dt]).strftime("%H:%M:%S")
    @temp = attributes[:temp]
    @conditions = attributes[:weather][0][:main]
    @icon = attributes[:weather][0][:icon]
  end 



end 