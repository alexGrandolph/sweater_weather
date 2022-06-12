class Api::V1::UsersController < ApplicationController


  def create
    # binding.pry
    if params[:password] == params[:password_confirmation]
      user = User.create!(email: params[:email], password: params[:password])
      if user.save
        user.api_key = SecureRandom.hex 
      end
      render json: UserSerializer.new_user(user), status: 201
    else 
      # render json: status: 404
    end 
  end 

  private
  


end 