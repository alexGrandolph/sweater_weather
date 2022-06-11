class BackgroundFacade

  def self.get_background(location)
    result = BackgroundService.get_background_for_location(location)
    Background.new(result)
  end 


end 