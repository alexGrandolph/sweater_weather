require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has readable attributes' do
    raw = File.read('spec/fixtures/handrolled/forecast.json')
    data = JSON.parse(raw, symbolize_names: true)
    forecast = Forecast.new(data)
    
    raw_route = File.read('spec/fixtures/handrolled/route.json')
    route_data = JSON.parse(raw_route, symbolize_names: true)
    route = Route.new(route_data)

    trip = RoadTrip.new(forecast, route)

    expect(trip).to be_a RoadTrip
    expect(trip.forecast).to eq(forecast)
    expect(trip.route).to eq(route)
    expect(trip.travel_time).to eq("06:23:02")
    expect(trip.distance).to eq(446.136)
    expect(trip.forecast_at_arrival).to eq(forecast.hourly[6])
    # binding.pry

  end
end