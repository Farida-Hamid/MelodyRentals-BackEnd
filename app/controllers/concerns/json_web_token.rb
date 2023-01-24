require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern

  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, exp_date = 7.days.from_now)
    payload[:exp_date] = exp_date.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
