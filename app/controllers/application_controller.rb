class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_bad_credentials_response
  private
  
  def render_bad_credentials_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
