# frozen_string_literal: true

# AuthController is used for handling user sessions
class AuthController < ApplicationController
  before_action :set_jwt_secret, only: %i[login persist]

  def login
    user = User.find_by(username: login_params[:username])
    if user&.authenticate(login_params[:password])
      token = JWT.encode({ user_id: user.id }, @jwt_secret, 'HS256')
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def persist
    return unless request.headers['Authorization']

    encoded_token = request.headers['Authorization'].split(' ')[1]
    token = JWT.decode(encoded_token, @jwt_secret)
    user_id = token[0]['user_id']
    user = User.find(user_id)
    render json: user
  end

  private

  def login_params
    params.permit(:username, :password)
  end

  def set_jwt_secret
    @jwt_secret = Rails.application.credentials.jwt_secret
  end
end
