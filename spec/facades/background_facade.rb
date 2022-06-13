require 'rails_helper'

RSpec.describe BackgroundFacade do

  it 'returns a Background poro', :vcr do
    Background = BackgroundFacade.get_background_for_location("portland")

    expect(Background).to be_a Background
  end



end 