class CurrentForecast
  attr_reader :datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon


  def initialize(attributes)
    @datetime = Time.at(attributes[:dt])
    @sunrise = Time.at(attributes[:sunrise])
    @sunset = Time.at(attributes[:sunset])
    @temp = attributes[:temp]
    @feels_like = attributes[:feels_like]
    @humidity = attributes[:humidity]
    @uvi = attributes[:uvi]
    @visibility = attributes[:visibility]
    @conditions = attributes[:weather][0][:main]
    @icon = attributes[:weather][0][:icon]
  end 


end 