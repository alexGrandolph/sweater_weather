class CurrentForecast
  attr_reader :datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon


  def initialize(attributes)
 
    @datetime = Time.at(attributes[:current][:dt]).to_s
    @sunrise = Time.at(attributes[:current][:sunrise]).to_s
    @sunset = Time.at(attributes[:current][:sunset]).to_s
    @temp = attributes[:current][:temp]
    @feels_like = attributes[:current][:feels_like]
    @humidity = attributes[:current][:humidity]
    @uvi = attributes[:current][:uvi]
    @visibility = attributes[:current][:visibility]
    @conditions = attributes[:current][:weather][0][:main]
    @icon = attributes[:current][:weather][0][:icon]
    @daily = attributes[:daily].map { |day| DailyForecast.new(day) }
  end 


end 