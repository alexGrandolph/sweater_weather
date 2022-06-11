class Api::V1::BackgroundsController < ApplicationController


  def index
    begin
      location = params[:location]
      background = BackgroundFacade.get_background(location)
      render json: BackgroundSerializer.background(background, location)
    rescue NoMethodError
      render status: 404
    end 
  end
  


end