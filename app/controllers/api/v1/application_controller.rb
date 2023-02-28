# frozen_string_literal: true

class Api::V1::ApplicationController < ActionController::API
  before_action :require_jwt

  def require_jwt
    token = request.headers["HTTP_AUTHORIZATION"]
    if !token
      head :forbidden
    end
    if !valid_token(token)
      head :forbidden
    end
  end

  private
  def valid_token(token)
    unless token
      return false
    end

    token.gsub!('Bearer ','')
    begin
      decoded_token = JWT.decode token, Rails.configuration.x.oauth.jwt_secret, true
      return true
    rescue JWT::DecodeError => e
      Rails.logger.warn "Error decoding the JWT: "+ e.to_s
    end
    false
  end
end
