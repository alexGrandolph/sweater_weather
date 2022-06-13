class Api::V1::BookSearchController < ApplicationController


  def index
    location = params[:location]
    quantity = params[:quantity]
    books = BookFacade.get_the_books(location, quantity)

  end 


end