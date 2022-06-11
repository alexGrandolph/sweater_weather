class Api::V1::ForecastController < ApplicationController

  def index
    begin
      coordinates = get_latitude_longitude
      forecast = ForecastFacade.get_forecast(coordinates.latitude, coordinates.longitude)
      render json: ForecastSerializer.forecast(forecast)
    rescue NoMethodError
      render status: 404
    end 
  end 



  private
    def get_latitude_longitude
      city = params[:location]
      LocationFacade.coordinates_for_city(city)
    end 


end 