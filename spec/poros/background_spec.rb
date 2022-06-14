require 'rails_helper'

RSpec.describe Background do
  it 'exists and has readable attributes', :vcr do
    raw = File.read('spec/fixtures/handrolled/background.json')
    data = JSON.parse(raw, symbolize_names: true)[:results][0]
    background = Background.new(data)

    expect(background).to be_a Background
    expect(background.image_url).to eq("https://images.unsplash.com/photo-1642980364256-12e2811c91ae?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY4Njd8MHwxfHNlYXJjaHwxfHxtaWFtaSUyQ2ZsfGVufDB8fHx8MTY1NTA4OTQ0OQ&ixlib=rb-1.2.1&q=80")
    expect(background.source).to eq('https://api.unsplash.com/photos/67uJo7mZPCo')
    expect(background.author).to eq('Andre Tan')
    expect(background.description).to eq("instagram: @andredantan")
    expect(background.area).to eq("Miami, FL")
    expect(background.area).to be_a String

  end
end