require 'rails_helper'

RSpec.describe Route do
  it 'exists and has readable attributes' do
    raw = File.read('spec/fixtures/handrolled/route.json')
    data = JSON.parse(raw, symbolize_names: true)

    route = Route.new(data)

    expect(route).to be_a Route
    expect(route.time).to eq("06:23:02")
    expect(route.seconds).to eq(24799)
    expect(route.distance).to eq(446.136)
  end 
end