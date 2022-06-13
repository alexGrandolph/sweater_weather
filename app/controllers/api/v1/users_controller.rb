class Api::V1::UsersController < ApplicationController


  def create
    if params[:password] == params[:password_confirmation]
      user = User.create!(email: params[:email], password: params[:password])
      if user.save
        user.api_key = SecureRandom.hex(15)
      end
      render json: UserSerializer.new_user(user), status: 201
    elsif params[:password] != params[:password_confirmation]
     render json: ErrorSerializer.password_mismatch
    end 
  end 

  


end 