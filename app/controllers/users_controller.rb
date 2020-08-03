# frozen_string_literal: true

# UsersController is used to manage users
class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :set_jwt_secret, only: %i[create]

  def show
    render json: @user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({ user_id: user.id }, @jwt_secret, 'HS256')
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors_full_messages }
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_jwt_secret
    @jwt_secret = Rails.application.credentials.jwt_secret
  end
end
