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
      if books.first.empty? == true || books.last == 0
        render json: ErrorSerializer.no_books_found
      else
        forecast = BookForecastFacade.get_book_destination_forecast(city)
        render json: BookSerializer.book_search_response(books, forecast, city)
      end 
    end 
  end 


end