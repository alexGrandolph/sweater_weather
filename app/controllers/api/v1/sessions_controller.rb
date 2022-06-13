class Api::V1::SessionsController < ApplicationController

  def login
    user = User.find_by(email: user_params[:email])
    binding.pry
    if user && user.authenticate(user_params[:password])
      render json: UserSerializer.session_login(user)
    else
      render json: ErrorSerializer.bad_credentials
    end
  end
  

  private
    def user_params
      params.permit(:email, :password)

    end
    


end 