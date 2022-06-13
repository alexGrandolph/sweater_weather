class Api::V1::BookSearchController < ApplicationController


  def index
    if params[:quantity].to_i <= 0
      render json: ErrorSerializer.bad_quantity

    elsif params[:location].blank? == true
      render json: ErrorSerializer.empty_location

    else
      city = params[:location]
      quantity = params[:quantity]
      books = BookFacade.get_the_books(city, quantity)
      
      location = LocationFacade.coordinates_for_city(city)
      forecast = ForecastFacade.get_forecast(location.latitude, location.longitude)
      render json: BookSerializer.book_search_response(books, forecast, city)
    end 
  end 


end