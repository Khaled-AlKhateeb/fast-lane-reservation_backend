# require 'pry'

class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create login]
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    # binding.pry
    if @user.save
      token = encode_token(user_id: @user.id)
      render json: { status: 'SUCCESS', message: 'User created', data: { token: }, user: @user }, status: :created
    else
      render json: { status: 'ERROR', message: 'User could not be created', data: @user.errors }, status: :unprocessable_entity

    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token(user_id: @user.id)
      render json: { status: 'SUCCESS', message: 'Logged in', data: { token: token }, user:  @user }, status: :ok


    else
      render json: { status: 'ERROR', message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password,:email, :password_confirmation)
  end
end
