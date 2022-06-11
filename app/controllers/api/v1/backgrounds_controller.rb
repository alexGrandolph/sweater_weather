class Api::V1::BackgroundsController < ApplicationController


  def index
    # binding.pry 
    location = params[:location]
    background = BackgroundsFacade.get_background(location)
  end
  


end