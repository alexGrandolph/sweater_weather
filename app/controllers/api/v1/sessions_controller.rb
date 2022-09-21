class Api::V1::SessionsController < ApplicationController
# skip_before_action :verify_authenticity_token
# skip_before_action :verify_authenticity_token, raise: false


  def login
    # binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.session_login(user)
    else
      render json: ErrorSerializer.bad_credentials, status: 422
    end
  end
  

  private
    def user_params
      params.permit(:email, :password)

    end
    


end 
# WORKS CORGI2.COM
# Started POST "/api/v1/sessions" for ::1 at 2022-09-17 15:27:39 -0600
#    (0.8ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
#   ↳ /Users/alexrandolph/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems/activerecord-5.2.8/lib/active_record/log_subscriber.rb:98
# Processing by Api::V1::SessionsController#login as JSON
#   Parameters: {"email"=>"corgi2.com", "password"=>"[FILTERED]", "session"=>{"email"=>"corgi2.com", "password"=>"[FILTERED]"}}
#   User Load (0.9ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = $1 LIMIT $2  [["email", "corgi2.com"], ["LIMIT", 1]]
#   ↳ app/controllers/api/v1/sessions_controller.rb:8
# Completed 200 OK in 278ms (Views: 0.2ms | ActiveRecord: 6.7ms)

