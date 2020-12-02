class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created
    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  def auto_login
    render json: @user, status: :ok
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
