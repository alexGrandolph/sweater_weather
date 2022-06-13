class DailyForecast
  attr_reader :datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attributes)
    # binding.pry
    @datetime = Time.at(attributes[:dt])
    @sunrise = attributes[:sunrise]
    @sunset = attributes[:sunset]
    @max_temp = attributes[:temp][:max]
    @min_temp = attributes[:temp][:min]
    @conditions = attributes[:weather][0][:main]
    @icon = attributes[:weather][0][:icon]

  end 



end 