class Api::V1::BackgroundsController < ApplicationController


  def index
    location = params[:location]
    background = BackgroundFacade.get_background(location)
    binding.pry
    render json: BackgroundSerializer.background(background, location)
  end
  


end