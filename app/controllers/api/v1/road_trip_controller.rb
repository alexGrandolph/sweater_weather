class Api::V1::RoadTripController < ApplicationController

  def show
    # binding.pry
    origin = params[:origin]
    destination = params[:destination]
    api_key = params[:api_key]
    # binding.pry
    if User.find_by(api_key: api_key)
      route_and_forecast = RoadTripFacade.route(origin, destination)
      render json: RoadTripSerializer.road_trip(origin, destination, route_and_forecast)
    end
  end


end