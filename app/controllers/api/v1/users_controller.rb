class Api::V1::UsersController < ApplicationController


  def create
    
    if params[:password] == params[:password_confirmation]
      user = User.new(email: params[:email], password: params[:password])
      if user.save
        user.api_key = SecureRandom.hex 
      end
      render json: UserSerializer.new_user(user)
    else 
      render json: status: 404
    end 
  end 

  private
  


end 