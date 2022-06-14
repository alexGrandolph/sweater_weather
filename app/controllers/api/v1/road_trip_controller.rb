class Api::V1::RoadTripController < ApplicationController

  def show
    origin = params[:origin]
    destination = params[:destination]
    api_key = params[:api_key]
    if User.find_by(api_key: api_key)
      road_trip = RoadTripFacade.route(origin, destination)
      if road_trip.is_a?(RoadTrip)
        render json: RoadTripSerializer.road_trip(origin, destination, road_trip)
      else
        render json: ErrorSerializer.impossible_route(origin, destination)
      end 
    end
  end


end