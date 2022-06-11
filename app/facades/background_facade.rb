class BackgroundFacade

  def self.get_background(location)
    result = BackgroundService.get_background_for_location(location)
    binding.pry


  end 


end 