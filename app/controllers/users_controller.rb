class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  #Get/ users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

   #GET/ me
  def show
    @user = @current_user
    render json: @user, status: :ok
  end

  # signup - create account and log in user /POST
  def create
    @user = User.create!(user_params) #user submits the signup form- it's a post request to our users end point 
    if @user.valid?
      session[:user_id] = @user.id # login/remembering who our user is through entire app
      render json: @user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    #only allow a list of trusted parameters through
    params.permit(:username, :password)
  end
end