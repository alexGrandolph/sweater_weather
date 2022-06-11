require 'rails_helper'

RSpec.describe Background do
  it 'exists and has readable attributes', :vcr do
    data = BackgroundService.get_background_for_location('miami,fl')[:results]
    binding.pry


    background = Background.new(data)

    expect(background).to be_a Background
  end
end