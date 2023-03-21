class ApplicationController < ActionController::API
  before_action :authenticate_request

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token(token)
    decode = JWT.decode(token, 'secret').first
    HashWithIndifferentAccess.new decode
  end

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split.last if header.present?
    begin
      decoded_token = decode_token(token)
      @current_user_id = decoded_token['user_id']
    rescue JWT::DecodeError
      render json: { status: 'ERROR', message: 'Invalid token' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= User.find(@current_user_id)
  end
end
