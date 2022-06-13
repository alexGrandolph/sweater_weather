require 'rails_helper'

RSpec.describe Route do
  it 'exists and has readable attributes' do
    raw = File.read('spec/fixtures/handrolled/route.json')
    data = JSON.parse(raw, symbolize_names: true)

    route = Route.new(data)

    expect(route).to be_a Route
    expect(route.time).to be_an Array

end