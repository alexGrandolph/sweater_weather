class Api::V1::ForecastController < ApplicationController

  def index
    coordinates = get_latitude_longitude
  end 



  private
    def get_latitude_longitude
      city = params[:location]
      LocationFacade.coordinates_for_city(city)
    end 


end 