class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      @user.update_attribute(:is_logedin, true)
      # session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end