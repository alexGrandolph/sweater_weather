class Api::V1::UsersController < ApplicationController


  def create
    if params[:password] == params[:password_confirmation]
      user = User.create!(email: params[:email], password: params[:password])
      user.api_key = SecureRandom.hex(15)
      if user.save
        render json: UserSerializer.new_user(user), status: 201
      end
    elsif params[:password] != params[:password_confirmation]
      render json: ErrorSerializer.password_mismatch, status: 422
    end  
  end 

  


end 