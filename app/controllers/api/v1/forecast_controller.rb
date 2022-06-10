class Api::V1::ForecastController < ApplicationController

  def index
    coordinates = get_latitude_longitude
  end 



  private
    def get_latitude_longitude
      location = params[:location]
      LocationFacade.latitude_longitude(location)
    end 


end 