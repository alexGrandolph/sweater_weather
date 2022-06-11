require 'rails_helper'

RSpec.describe Background do
  it 'exists and has readable attributes', :vcr do
    data = BackgroundService.get_background_for_location('miami,fl')[:results]
    # binding.pry


    background = Background.new(data)

    expect(background).to be_a Background
    expect(background.location).to eq('Miami, FL')
    expect(background.image_url).to eq("https://images.unsplash.com/photo-1642980364256-12e2811c91ae?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY4Njd8MHwxfHNlYXJjaHwxfHxtaWFtaSUyQ2ZsfGVufDB8fHx8MTY1NDk3ODQ1Ng&ixlib=rb-1.2.1&q=80")
    expect(background.source).to eq('unsplash.com')
    expect(background.author).to eq('Andre Tan')
  end
end