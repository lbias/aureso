class ApplicationController < ActionController::API
  before_action :authenticate_token

  private

  def authenticate_token
    unless authenticate_with_http_token { |token, options| token == 'secret' }
      render json: { error: 'Invalid Token.' }, status: 401
    end
  end
end
